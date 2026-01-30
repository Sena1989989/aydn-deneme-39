import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hayvan Gölgeleri',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const AnimalShadowGame(),
    );
  }
}

class AnimalShadowGame extends StatefulWidget {
  const AnimalShadowGame({super.key});

  @override
  State<AnimalShadowGame> createState() => _AnimalShadowGameState();
}

class _AnimalShadowGameState extends State<AnimalShadowGame> with TickerProviderStateMixin {
  // Kategoriler
  final Map<String, List<Animal>> categories = {
    'Evcil Hayvanlar': [
      Animal('Kedi', '🐱', Colors.orange, 'cat.mp3'),
      Animal('Köpek', '🐕', Colors.brown, 'dog.mp3'),
      Animal('Kuş', '🐦', Colors.blue, 'bird.mp3'),
      Animal('Tavşan', '🐰', Colors.pink, 'rabbit.mp3'),
    ],
    'Çiftlik Hayvanları': [
      Animal('İnek', '🐄', Colors.brown.shade400, 'cow.mp3'),
      Animal('At', '🐴', Colors.brown.shade700, 'horse.mp3'),
      Animal('Koyun', '🐑', Colors.grey.shade300, 'lamb.mp3'),
      Animal('Horoz', '🐓', Colors.red, 'chicken.mp3'),
    ],
    'Orman Hayvanları': [
      Animal('Aslan', '🦁', Colors.orange.shade700, 'lion.mp3'),
      Animal('Ayı', '🐻', Colors.brown.shade900, 'bear.mp3'),
      Animal('Tilki', '🦊', Colors.deepOrange, 'fox.mp3'),
      Animal('Maymun', '🐵', Colors.brown.shade600, 'monkey.mp3'),
    ],
  };

  List<Animal> animals = [];
  String? selectedCategory;
  bool showStartScreen = true;
  bool showCategorySelector = false;

  final AudioPlayer audioPlayer = AudioPlayer();
  final AudioPlayer backgroundMusicPlayer = AudioPlayer();
  late AnimationController _gradientController;
  late Animation<double> _gradientAnimation;
  
  List<Offset> sparklePositions = [];
  List<double> sparkleOpacities = [];

  Map<String, String?> placedAnimals = {};
  int correctMatches = 0;
  List<Animal> shuffledAnimals = [];
  List<Animal> shadowTargets = [];

  @override
  void initState() {
    super.initState();
    _gradientController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);
    
    _gradientAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_gradientController);
    
    // Parıltı pozisyonları oluştur
    for (int i = 0; i < 20; i++) {
      sparklePositions.add(Offset(
        Random().nextDouble(),
        Random().nextDouble(),
      ));
      sparkleOpacities.add(Random().nextDouble());
    }
  }

  Future<void> _playBackgroundMusic() async {
    try {
      await backgroundMusicPlayer.setReleaseMode(ReleaseMode.loop);
      await backgroundMusicPlayer.setVolume(0.3);
      await backgroundMusicPlayer.play(AssetSource('sounds/lullaby-baby.mp3'));
    } catch (e) {
      print('Arka plan müziği hatası: $e');
    }
  }

  @override
  void dispose() {
    _gradientController.dispose();
    audioPlayer.dispose();
    backgroundMusicPlayer.stop();
    backgroundMusicPlayer.dispose();
    super.dispose();
  }

  Future<void> playAnimalSound(String soundFile) async {
    try {
      await audioPlayer.play(AssetSource('sounds/$soundFile'));
    } catch (e) {
      print('Ses çalma hatası: $e');
    }
  }

  void startNewGame() {
    setState(() {
      placedAnimals.clear();
      correctMatches = 0;
      shuffledAnimals = List.from(animals)..shuffle();
      shadowTargets = List.from(animals)..shuffle();
    });
  }

  void startGame() {
    setState(() {
      showStartScreen = false;
      showCategorySelector = true;
    });
    // Kullanıcı tıkladığında müziği başlat
    _playBackgroundMusic();
  }

  void selectCategory(String category) {
    setState(() {
      selectedCategory = category;
      animals = categories[category]!;
      showCategorySelector = false;
    });
    startNewGame();
  }

  void backToCategories() {
    setState(() {
      showCategorySelector = true;
      selectedCategory = null;
    });
  }

  List<Color> getCategoryColors() {
    switch (selectedCategory) {
      case 'Evcil Hayvanlar':
        return [Colors.orange.shade200, Colors.pink.shade200, Colors.yellow.shade100, Colors.purple.shade100];
      case 'Çiftlik Hayvanları':
        return [Colors.green.shade200, Colors.lime.shade100, Colors.yellow.shade200, Colors.brown.shade100];
      case 'Orman Hayvanları':
        return [Colors.green.shade400, Colors.brown.shade300, Colors.green.shade700, Colors.orange.shade200];
      default:
        return [Colors.pink.shade100, Colors.yellow.shade100, Colors.blue.shade100, Colors.green.shade100];
    }
  }

  @override
  Widget build(BuildContext context) {
    // Başlangıç ekranı
    if (showStartScreen) {
      return Scaffold(
        body: AnimatedBuilder(
          animation: _gradientAnimation,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.lerp(Colors.pink.shade200, Colors.purple.shade300, _gradientAnimation.value)!,
                    Color.lerp(Colors.yellow.shade200, Colors.orange.shade200, _gradientAnimation.value)!,
                    Color.lerp(Colors.blue.shade200, Colors.cyan.shade200, _gradientAnimation.value)!,
                    Color.lerp(Colors.green.shade200, Colors.teal.shade200, _gradientAnimation.value)!,
                  ],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '🎮',
                      style: TextStyle(fontSize: 100),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Hayvan Eşleştirme Oyunu',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 4,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                    ElevatedButton(
                      onPressed: startGame,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 8,
                      ),
                      child: const Text(
                        '🎵 BAŞLA',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
    
    // Kategori seçim ekranı
    if (showCategorySelector) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            '🎮 Hayvan Oyunu',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.purple.shade300,
          centerTitle: true,
        ),
        body: AnimatedBuilder(
          animation: _gradientAnimation,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.lerp(Colors.pink.shade200, Colors.purple.shade300, _gradientAnimation.value)!,
                    Color.lerp(Colors.yellow.shade200, Colors.orange.shade200, _gradientAnimation.value)!,
                    Color.lerp(Colors.blue.shade200, Colors.cyan.shade200, _gradientAnimation.value)!,
                    Color.lerp(Colors.green.shade200, Colors.teal.shade200, _gradientAnimation.value)!,
                  ],
                ),
              ),
              child: Stack(
                children: [
                  // Parıltı efektleri
                  ...List.generate(sparklePositions.length, (index) {
                    return Positioned(
                      left: sparklePositions[index].dx * MediaQuery.of(context).size.width,
                      top: sparklePositions[index].dy * MediaQuery.of(context).size.height,
                      child: AnimatedBuilder(
                        animation: _gradientController,
                        builder: (context, child) {
                          return Opacity(
                            opacity: (sparkleOpacities[index] * _gradientAnimation.value).clamp(0.0, 0.5),
                            child: Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 20 + (10 * _gradientAnimation.value),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                  child!,
                ],
              ),
            );
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Column(
                    children: [
                      Text(
                        '✨ Kategori Seç ✨',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Hangi hayvanlarla oynamak istersin?',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                _buildCategoryButton(
                  'Evcil Hayvanlar',
                  '🐱 🐕 🐦 🐰',
                  Colors.orange,
                ),
                const SizedBox(height: 25),
                _buildCategoryButton(
                  'Çiftlik Hayvanları',
                  '🐄 🐴 🐑 🐓',
                  Colors.green,
                ),
                const SizedBox(height: 25),
                _buildCategoryButton(
                  'Orman Hayvanları',
                  '🦁 🐻 🦊 🐵',
                  Colors.brown,
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Oyun ekranı
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 30),
          onPressed: backToCategories,
        ),
        title: Text(
          selectedCategory ?? 'Hayvan Oyunu',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple.shade300,
        centerTitle: true,
      ),
      body: AnimatedBuilder(
        animation: _gradientAnimation,
        builder: (context, child) {
          List<Color> categoryColors = getCategoryColors();
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: categoryColors.asMap().entries.map((entry) {
                  int idx = entry.key;
                  Color color = entry.value;
                  Color nextColor = categoryColors[(idx + 1) % categoryColors.length];
                  return Color.lerp(color, nextColor, _gradientAnimation.value * 0.3)!;
                }).toList(),
              ),
            ),
            child: Stack(
              children: [
                // Parıltı efektleri
                ...List.generate(15, (index) {
                  return Positioned(
                    left: sparklePositions[index].dx * MediaQuery.of(context).size.width,
                    top: sparklePositions[index].dy * MediaQuery.of(context).size.height,
                    child: AnimatedBuilder(
                      animation: _gradientController,
                      builder: (context, child) {
                        return Opacity(
                          opacity: (sparkleOpacities[index] * (1 - _gradientAnimation.value)).clamp(0.0, 0.4),
                          child: Icon(
                            Icons.star,
                            color: Colors.white70,
                            size: 15 + (8 * (1 - _gradientAnimation.value)),
                          ),
                        );
                      },
                    ),
                  );
                }),
                child!,
              ],
            ),
          );
        },
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                '✨ Hayvanları eşleştir! ✨',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            // Sürüklenebilir hayvanlar
            Expanded(
              flex: 2,
              child: Wrap(
                spacing: 30,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: shuffledAnimals.map((animal) {
                  bool isPlaced = placedAnimals.containsValue(animal.name);
                  return isPlaced
                      ? const SizedBox(width: 140, height: 140)
                      : Draggable<String>(
                          data: animal.name,
                          feedback: Material(
                            color: Colors.transparent,
                            child: Transform.scale(
                              scale: 1.3,
                              child: AnimalWidget(animal: animal, isDragging: true),
                            ),
                          ),
                          childWhenDragging: Opacity(
                            opacity: 0.2,
                            child: AnimalWidget(animal: animal),
                          ),
                          child: AnimalWidget(animal: animal),
                        );
                }).toList(),
              ),
            ),
            
            Container(
              height: 3,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.purple],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            
            // Gölge hedefleri
            Expanded(
              flex: 3,
              child: Wrap(
                spacing: 30,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: shadowTargets.map((animal) {
                  return DragTarget<String>(
                    onAccept: (data) {
                      if (data == animal.name) {
                        setState(() {
                          placedAnimals[animal.name] = data;
                          correctMatches++;
                        });
                        playAnimalSound(animal.soundFile);
                        _showSuccessDialog();
                        
                        if (placedAnimals.length == animals.length) {
                          Future.delayed(const Duration(milliseconds: 500), () {
                            _showWinDialog();
                          });
                        }
                      } else {
                        _showErrorDialog();
                      }
                    },
                    onWillAccept: (data) => placedAnimals[animal.name] == null,
                    builder: (context, candidateData, rejectedData) {
                      bool isCorrect = placedAnimals[animal.name] != null;
                      return ShadowTarget(
                        animal: animal,
                        isCorrect: isCorrect,
                        isHighlighted: candidateData.isNotEmpty,
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: startNewGame,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.refresh, size: 40, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Tekrar Oyna',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String title, String emojis, Color color) {
    return ElevatedButton(
      onPressed: () => selectCategory(title),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
        minimumSize: const Size(320, 90),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 8,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            emojis,
            style: const TextStyle(fontSize: 35),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog() {
    final messages = [
      '🎉 Aferin! Çok güzel!',
      '⭐ Harika! Süpersin!',
      '🌟 Bravo! Doğru!',
      '💚 Tebrikler! Mükemmel!',
    ];
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          messages[Random().nextInt(messages.length)],
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        duration: const Duration(milliseconds: 1200),
      ),
    );
  }

  void _showErrorDialog() {
    final messages = [
      '😊 Tekrar dene!',
      '🤔 Başka hayvan dene!',
      '💭 Doğru olanı bul!',
    ];
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          messages[Random().nextInt(messages.length)],
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
        duration: const Duration(milliseconds: 1000),
      ),
    );
  }

  void _showWinDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.yellow.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: Colors.orange, width: 5),
        ),
        title: const Column(
          children: [
            Text(
              '🎉🎊🏆',
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(height: 10),
            Text(
              'YAŞASIN!',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Tüm hayvanları\nbuldun!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              '⭐⭐⭐⭐⭐',
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                startNewGame();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Tekrar Oyna! 🎮',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Animal {
  final String name;
  final String emoji;
  final Color color;
  final String soundFile;

  Animal(this.name, this.emoji, this.color, this.soundFile);
}

class AnimalWidget extends StatelessWidget {
  final Animal animal;
  final bool isDragging;

  const AnimalWidget({
    super.key,
    required this.animal,
    this.isDragging = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            animal.color.withOpacity(0.6),
            animal.color.withOpacity(0.3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: animal.color, width: 5),
        boxShadow: [
          BoxShadow(
            color: animal.color.withOpacity(0.5),
            blurRadius: isDragging ? 20 : 8,
            spreadRadius: isDragging ? 5 : 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            animal.emoji,
            style: const TextStyle(fontSize: 70),
          ),
        ],
      ),
    );
  }
}

class ShadowTarget extends StatelessWidget {
  final Animal animal;
  final bool isCorrect;
  final bool isHighlighted;

  const ShadowTarget({
    super.key,
    required this.animal,
    required this.isCorrect,
    required this.isHighlighted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isHighlighted
              ? [Colors.yellow.shade300, Colors.orange.shade200]
              : [Colors.grey.shade300, Colors.grey.shade200],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: isHighlighted ? Colors.orange : Colors.grey.shade400,
          width: 5,
        ),
        boxShadow: [
          BoxShadow(
            color: isHighlighted ? Colors.yellow.withOpacity(0.6) : Colors.grey.withOpacity(0.3),
            blurRadius: isHighlighted ? 15 : 5,
            spreadRadius: isHighlighted ? 3 : 1,
          ),
        ],
      ),
      child: isCorrect
          ? Center(
              child: Text(
                animal.emoji,
                style: const TextStyle(fontSize: 70),
              ),
            )
          : Center(
              child: Text(
                animal.emoji,
                style: TextStyle(
                  fontSize: 70,
                  color: Colors.black.withOpacity(0.15),
                ),
              ),
            ),
    );
  }
}
