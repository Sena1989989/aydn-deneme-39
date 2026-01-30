import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

enum AppLanguage {
  turkish('tr', 'Türkçe', '🇹🇷'),
  english('en', 'English', '🇬🇧'),
  chinese('zh', '中文', '🇨🇳'),
  japanese('ja', '日本語', '🇯🇵'),
  korean('ko', '한국어', '🇰🇷'),
  hindi('hi', 'हिन्दी', '🇮🇳'),
  arabic('ar', 'العربية', '🇸🇦'),
  greek('el', 'Ελληνικά', '🇬🇷'),
  bulgarian('bg', 'Български', '🇧🇬'),
  romanian('ro', 'Română', '🇷🇴'),
  serbian('sr', 'Српски', '🇷🇸'),
  croatian('hr', 'Hrvatski', '🇭🇷'),
  bosnian('bs', 'Bosanski', '🇧🇦'),
  albanian('sq', 'Shqip', '🇦🇱'),
  macedonian('mk', 'Македонски', '🇲🇰'),
  slovenian('sl', 'Slovenščina', '🇸🇮'),
  urdu('ur', 'اردو', '🇵🇰'),
  bengali('bn', 'বাংলা', '🇧🇩'),
  vietnamese('vi', 'Tiếng Việt', '🇻🇳'),
  thai('th', 'ไทย', '🇹🇭'),
  indonesian('id', 'Bahasa Indonesia', '🇮🇩'),
  malay('ms', 'Bahasa Melayu', '🇲🇾'),
  filipino('tl', 'Filipino', '🇵🇭'),
  persian('fa', 'فارسی', '🇮🇷'),
  hebrew('he', 'עברית', '🇮🇱');

  final String code;
  final String name;
  final String flag;
  const AppLanguage(this.code, this.name, this.flag);
}

class AppStrings {
  static Map<AppLanguage, Map<String, String>> translations = {
    AppLanguage.turkish: {
      'title': 'Hayvan Eşleştirme Oyunu',
      'start': '🎵 BAŞLA',
      'selectCategory': '✨ Kategori Seç ✨',
      'whichAnimals': 'Hangi hayvanlarla oynamak istersin?',
      'pets': 'Evcil Hayvanlar',
      'farm': 'Çiftlik Hayvanları',
      'forest': 'Orman Hayvanları',
      'match': '✨ Hayvanları eşleştir! ✨',
      'playAgain': 'Tekrar Oyna',
      'congrats': 'YAŞASIN!',
      'foundAll': 'Tüm hayvanları\nbuldun!',
      'playAgainBtn': 'Tekrar Oyna! 🎮',
    },
    AppLanguage.english: {
      'title': 'Animal Matching Game',
      'start': '🎵 START',
      'selectCategory': '✨ Select Category ✨',
      'whichAnimals': 'Which animals do you want to play with?',
      'pets': 'Pets',
      'farm': 'Farm Animals',
      'forest': 'Forest Animals',
      'match': '✨ Match the animals! ✨',
      'playAgain': 'Play Again',
      'congrats': 'HOORAY!',
      'foundAll': 'You found all\nanimals!',
      'playAgainBtn': 'Play Again! 🎮',
    },
    AppLanguage.chinese: {
      'title': '动物配对游戏',
      'start': '🎵 开始',
      'selectCategory': '✨ 选择类别 ✨',
      'whichAnimals': '你想玩什么动物？',
      'pets': '宠物',
      'farm': '农场动物',
      'forest': '森林动物',
      'match': '✨ 配对动物！ ✨',
      'playAgain': '再玩一次',
      'congrats': '太棒了！',
      'foundAll': '你找到了所有\n动物！',
      'playAgainBtn': '再玩一次！ 🎮',
    },
    AppLanguage.japanese: {
      'title': '動物マッチングゲーム',
      'start': '🎵 スタート',
      'selectCategory': '✨ カテゴリを選択 ✨',
      'whichAnimals': 'どの動物で遊びたいですか？',
      'pets': 'ペット',
      'farm': '農場の動物',
      'forest': '森の動物',
      'match': '✨ 動物をマッチしよう！ ✨',
      'playAgain': 'もう一度',
      'congrats': 'やったー！',
      'foundAll': '全部の動物を\n見つけたよ！',
      'playAgainBtn': 'もう一度！ 🎮',
    },
    AppLanguage.korean: {
      'title': '동물 매칭 게임',
      'start': '🎵 시작',
      'selectCategory': '✨ 카테고리 선택 ✨',
      'whichAnimals': '어떤 동물로 놀고 싶어요?',
      'pets': '애완동물',
      'farm': '농장 동물',
      'forest': '숲 동물',
      'match': '✨ 동물을 매칭하세요！ ✨',
      'playAgain': '다시 하기',
      'congrats': '만세！',
      'foundAll': '모든 동물을\n찾았어요！',
      'playAgainBtn': '다시 하기！ 🎮',
    },
    AppLanguage.hindi: {
      'title': 'पशु मिलान खेल',
      'start': '🎵 शुरू करें',
      'selectCategory': '✨ श्रेणी चुनें ✨',
      'whichAnimals': 'आप किन जानवरों के साथ खेलना चाहते हैं?',
      'pets': 'पालतू जानवर',
      'farm': 'खेत के जानवर',
      'forest': 'जंगल के जानवर',
      'match': '✨ जानवरों को मिलाएं！ ✨',
      'playAgain': 'फिर से खेलें',
      'congrats': 'शाबाश！',
      'foundAll': 'आपने सभी जानवर\nढूंढ लिए！',
      'playAgainBtn': 'फिर से खेलें！ 🎮',
    },
    AppLanguage.arabic: {
      'title': 'لعبة مطابقة الحيوانات',
      'start': '🎵 ابدأ',
      'selectCategory': '✨ اختر الفئة ✨',
      'whichAnimals': 'أي الحيوانات تريد أن تلعب؟',
      'pets': 'حيوانات أليفة',
      'farm': 'حيوانات المزرعة',
      'forest': 'حيوانات الغابة',
      'match': '✨ طابق الحيوانات！ ✨',
      'playAgain': 'العب مرة أخرى',
      'congrats': 'يا هلا！',
      'foundAll': 'وجدت جميع\nالحيوانات！',
      'playAgainBtn': 'العب مرة أخرى！ 🎮',
    },
    AppLanguage.greek: {
      'title': 'Παιχνίδι ταιριάσματος ζώων',
      'start': '🎵 ΕΝΑΡΞΗ',
      'selectCategory': '✨ Επιλέξτε κατηγορία ✨',
      'whichAnimals': 'Με ποια ζώα θέλεις να παίξεις;',
      'pets': 'Κατοικίδια',
      'farm': 'Ζώα φάρμας',
      'forest': 'Ζώα δάσους',
      'match': '✨ Ταίριαξε τα ζώα！ ✨',
      'playAgain': 'Παίξε ξανά',
      'congrats': 'ΜΠΡΑΒΟ！',
      'foundAll': 'Βρήκες όλα\nτα ζώα！',
      'playAgainBtn': 'Παίξε ξανά！ 🎮',
    },
    AppLanguage.bulgarian: {
      'title': 'Игра за съвпадение на животни',
      'start': '🎵 СТАРТ',
      'selectCategory': '✨ Изберете категория ✨',
      'whichAnimals': 'С кои животни искаш да играеш?',
      'pets': 'Домашни любимци',
      'farm': 'Животни от фермата',
      'forest': 'Горски животни',
      'match': '✨ Съвпадни животните！ ✨',
      'playAgain': 'Играй отново',
      'congrats': 'БРАВО！',
      'foundAll': 'Намери всички\nживотни！',
      'playAgainBtn': 'Играй отново！ 🎮',
    },
    AppLanguage.romanian: {
      'title': 'Joc de potrivire a animalelor',
      'start': '🎵 START',
      'selectCategory': '✨ Selectați categoria ✨',
      'whichAnimals': 'Cu ce animale vrei să te joci?',
      'pets': 'Animale de companie',
      'farm': 'Animale de fermă',
      'forest': 'Animale de pădure',
      'match': '✨ Potrivește animalele！ ✨',
      'playAgain': 'Joacă din nou',
      'congrats': 'BRAVO！',
      'foundAll': 'Ai găsit toate\nanimalele！',
      'playAgainBtn': 'Joacă din nou！ 🎮',
    },
    AppLanguage.serbian: {
      'title': 'Игра упаривања животиња',
      'start': '🎵 СТАРТ',
      'selectCategory': '✨ Изаберите категорију ✨',
      'whichAnimals': 'Са којим животињама желиш да играш?',
      'pets': 'Кућни љубимци',
      'farm': 'Животиње са фарме',
      'forest': 'Шумске животиње',
      'match': '✨ Упари животиње！ ✨',
      'playAgain': 'Играј поново',
      'congrats': 'БРАВО！',
      'foundAll': 'Пронашао си све\nживотиње！',
      'playAgainBtn': 'Играј поново！ 🎮',
    },
    AppLanguage.croatian: {
      'title': 'Igra sparivanja životinja',
      'start': '🎵 START',
      'selectCategory': '✨ Odaberite kategoriju ✨',
      'whichAnimals': 'S kojim životinjama želiš igrati?',
      'pets': 'Kućni ljubimci',
      'farm': 'Životinje s farme',
      'forest': 'Šumske životinje',
      'match': '✨ Spoji životinje！ ✨',
      'playAgain': 'Igraj ponovno',
      'congrats': 'BRAVO！',
      'foundAll': 'Pronašao si sve\nživotinje！',
      'playAgainBtn': 'Igraj ponovno！ 🎮',
    },
    AppLanguage.bosnian: {
      'title': 'Igra sparivanja životinja',
      'start': '🎵 START',
      'selectCategory': '✨ Odaberite kategoriju ✨',
      'whichAnimals': 'Sa kojim životinjama želiš igrati?',
      'pets': 'Kućni ljubimci',
      'farm': 'Životinje s farme',
      'forest': 'Šumske životinje',
      'match': '✨ Spoji životinje！ ✨',
      'playAgain': 'Igraj ponovo',
      'congrats': 'BRAVO！',
      'foundAll': 'Pronašao si sve\nživotinje！',
      'playAgainBtn': 'Igraj ponovo！ 🎮',
    },
    AppLanguage.albanian: {
      'title': 'Loja e përputhjes së kafshëve',
      'start': '🎵 FILLO',
      'selectCategory': '✨ Zgjidhni kategorinë ✨',
      'whichAnimals': 'Me cilat kafshë dëshiron të luash?',
      'pets': 'Kafshë shtëpiake',
      'farm': 'Kafshë ferme',
      'forest': 'Kafshë pylli',
      'match': '✨ Përputhi kafshët！ ✨',
      'playAgain': 'Luaj përsëri',
      'congrats': 'BRAVO！',
      'foundAll': 'I gjete të gjitha\nkafshët！',
      'playAgainBtn': 'Luaj përsëri！ 🎮',
    },
    AppLanguage.macedonian: {
      'title': 'Игра на спојување животни',
      'start': '🎵 СТАРТ',
      'selectCategory': '✨ Изберете категорија ✨',
      'whichAnimals': 'Со кои животни сакаш да играш?',
      'pets': 'Домашни миленици',
      'farm': 'Фармски животни',
      'forest': 'Шумски животни',
      'match': '✨ Спои ги животните！ ✨',
      'playAgain': 'Играј повторно',
      'congrats': 'БРАВО！',
      'foundAll': 'Ги најде сите\nживотни！',
      'playAgainBtn': 'Играј повторно！ 🎮',
    },
    AppLanguage.slovenian: {
      'title': 'Igra ujemanja živali',
      'start': '🎵 ZAČNI',
      'selectCategory': '✨ Izberite kategorijo ✨',
      'whichAnimals': 'S katerimi živalmi želiš igrati?',
      'pets': 'Hišni ljubljenčki',
      'farm': 'Kmetijske živali',
      'forest': 'Gozdne živali',
      'match': '✨ Poveži živali！ ✨',
      'playAgain': 'Igraj znova',
      'congrats': 'BRAVO！',
      'foundAll': 'Našel si vse\nživali！',
      'playAgainBtn': 'Igraj znova！ 🎮',
    },
    AppLanguage.urdu: {
      'title': 'جانوروں کا میچنگ گیم',
      'start': '🎵 شروع کریں',
      'selectCategory': '✨ زمرہ منتخب کریں ✨',
      'whichAnimals': 'آپ کن جانوروں کے ساتھ کھیلنا چاہتے ہیں؟',
      'pets': 'پالتو جانور',
      'farm': 'فارم کے جانور',
      'forest': 'جنگلی جانور',
      'match': '✨ جانوروں کو ملائیں！ ✨',
      'playAgain': 'دوبارہ کھیلیں',
      'congrats': 'شاباش！',
      'foundAll': 'آپ نے سب جانور\nڈھونڈ لیے！',
      'playAgainBtn': 'دوبارہ کھیلیں！ 🎮',
    },
    AppLanguage.bengali: {
      'title': 'প্রাণী মিলানের খেলা',
      'start': '🎵 শুরু করুন',
      'selectCategory': '✨ বিভাগ নির্বাচন করুন ✨',
      'whichAnimals': 'আপনি কোন প্রাণীদের সাথে খেলতে চান?',
      'pets': 'পোষা প্রাণী',
      'farm': 'খামারের প্রাণী',
      'forest': 'বন্য প্রাণী',
      'match': '✨ প্রাণী মিলান করুন！ ✨',
      'playAgain': 'আবার খেলুন',
      'congrats': 'বাহ！',
      'foundAll': 'আপনি সব প্রাণী\nখুঁজে পেয়েছেন！',
      'playAgainBtn': 'আবার খেলুন！ 🎮',
    },
    AppLanguage.vietnamese: {
      'title': 'Trò chơi ghép đôi động vật',
      'start': '🎵 BẮT ĐẦU',
      'selectCategory': '✨ Chọn danh mục ✨',
      'whichAnimals': 'Bạn muốn chơi với động vật nào?',
      'pets': 'Thú cưng',
      'farm': 'Động vật nông trại',
      'forest': 'Động vật rừng',
      'match': '✨ Ghép đôi động vật！ ✨',
      'playAgain': 'Chơi lại',
      'congrats': 'Tuyệt vời！',
      'foundAll': 'Bạn đã tìm tất cả\nđộng vật！',
      'playAgainBtn': 'Chơi lại！ 🎮',
    },
    AppLanguage.thai: {
      'title': 'เกมจับคู่สัตว์',
      'start': '🎵 เริ่ม',
      'selectCategory': '✨ เลือกหมวดหมู่ ✨',
      'whichAnimals': 'คุณอยากเล่นกับสัตว์ไหน？',
      'pets': 'สัตว์เลี้ยง',
      'farm': 'สัตว์ฟาร์ม',
      'forest': 'สัตว์ป่า',
      'match': '✨ จับคู่สัตว์！ ✨',
      'playAgain': 'เล่นอีกครั้ง',
      'congrats': 'เยี่ยม！',
      'foundAll': 'คุณหาสัตว์\nทั้งหมดแล้ว！',
      'playAgainBtn': 'เล่นอีกครั้ง！ 🎮',
    },
    AppLanguage.indonesian: {
      'title': 'Permainan mencocokkan hewan',
      'start': '🎵 MULAI',
      'selectCategory': '✨ Pilih kategori ✨',
      'whichAnimals': 'Hewan apa yang ingin kamu mainkan?',
      'pets': 'Hewan peliharaan',
      'farm': 'Hewan ternak',
      'forest': 'Hewan hutan',
      'match': '✨ Cocokkan hewan！ ✨',
      'playAgain': 'Main lagi',
      'congrats': 'Hore！',
      'foundAll': 'Kamu menemukan\nsemua hewan！',
      'playAgainBtn': 'Main lagi！ 🎮',
    },
    AppLanguage.malay: {
      'title': 'Permainan padanan haiwan',
      'start': '🎵 MULA',
      'selectCategory': '✨ Pilih kategori ✨',
      'whichAnimals': 'Haiwan apa yang anda mahu main?',
      'pets': 'Haiwan peliharaan',
      'farm': 'Haiwan ternakan',
      'forest': 'Haiwan hutan',
      'match': '✨ Padankan haiwan！ ✨',
      'playAgain': 'Main semula',
      'congrats': 'Tahniah！',
      'foundAll': 'Anda jumpa semua\nhaiwan！',
      'playAgainBtn': 'Main semula！ 🎮',
    },
    AppLanguage.filipino: {
      'title': 'Laro ng pagtutugma ng hayop',
      'start': '🎵 MAGSIMULA',
      'selectCategory': '✨ Pumili ng kategorya ✨',
      'whichAnimals': 'Anong hayop ang gusto mong laruin?',
      'pets': 'Alagang hayop',
      'farm': 'Hayop sa sakahan',
      'forest': 'Hayop sa gubat',
      'match': '✨ Itugma ang mga hayop！ ✨',
      'playAgain': 'Maglaro muli',
      'congrats': 'Mabuhay！',
      'foundAll': 'Nahanap mo ang\nlahat ng hayop！',
      'playAgainBtn': 'Maglaro muli！ 🎮',
    },
    AppLanguage.persian: {
      'title': 'بازی تطبیق حیوانات',
      'start': '🎵 شروع',
      'selectCategory': '✨ دسته را انتخاب کنید ✨',
      'whichAnimals': 'با کدام حیوانات می خواهید بازی کنید؟',
      'pets': 'حیوانات خانگی',
      'farm': 'حیوانات مزرعه',
      'forest': 'حیوانات جنگل',
      'match': '✨ حیوانات را تطبیق دهید！ ✨',
      'playAgain': 'دوباره بازی کنید',
      'congrats': 'آفرین！',
      'foundAll': 'همه حیوانات را\nپیدا کردید！',
      'playAgainBtn': 'دوباره بازی کنید！ 🎮',
    },
    AppLanguage.hebrew: {
      'title': 'משחק התאמת בעלי חיים',
      'start': '🎵 התחל',
      'selectCategory': '✨ בחר קטגוריה ✨',
      'whichAnimals': 'עם אילו בעלי חיים אתה רוצה לשחק?',
      'pets': 'חיות מחמד',
      'farm': 'חיות משק',
      'forest': 'חיות יער',
      'match': '✨ התאם את בעלי החיים！ ✨',
      'playAgain': 'שחק שוב',
      'congrats': 'היי！',
      'foundAll': 'מצאת את כל\nבעלי החיים！',
      'playAgainBtn': 'שחק שוב！ 🎮',
    },
  };

  static String get(String key, AppLanguage lang) {
    return translations[lang]?[key] ?? translations[AppLanguage.turkish]![key]!;
  }
}

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
  AppLanguage currentLanguage = AppLanguage.turkish;

  // Kategoriler
  final Map<String, List<Animal>> categories = {
    'pets': [
      Animal('Kedi', '🐱', Colors.orange, 'cat.mp3'),
      Animal('Köpek', '🐕', Colors.brown, 'dog.mp3'),
      Animal('Kuş', '🐦', Colors.blue, 'bird.mp3'),
      Animal('Tavşan', '🐰', Colors.pink, 'rabbit.mp3'),
    ],
    'farm': [
      Animal('İnek', '🐄', Colors.brown.shade400, 'cow.mp3'),
      Animal('At', '🐴', Colors.brown.shade700, 'horse.mp3'),
      Animal('Koyun', '🐑', Colors.grey.shade300, 'lamb.mp3'),
      Animal('Horoz', '🐓', Colors.red, 'chicken.mp3'),
    ],
    'forest': [
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
      // Arka plan müziğini kıs
      await backgroundMusicPlayer.setVolume(0.1);
      
      await audioPlayer.play(AssetSource('sounds/$soundFile'));
      
      // Hayvan sesi bittiğinde arka plan müziğini yükselt
      audioPlayer.onPlayerComplete.listen((event) {
        backgroundMusicPlayer.setVolume(0.3);
      });
    } catch (e) {
      print('Ses çalma hatası: $e');
      // Hata durumunda da müziği normale döndür
      backgroundMusicPlayer.setVolume(0.3);
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

  void selectCategory(String categoryKey) {
    setState(() {
      selectedCategory = categoryKey;
      animals = categories[categoryKey]!;
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
      case 'pets':
        return [Colors.orange.shade200, Colors.pink.shade200, Colors.yellow.shade100, Colors.purple.shade100];
      case 'farm':
        return [Colors.green.shade200, Colors.lime.shade100, Colors.yellow.shade200, Colors.brown.shade100];
      case 'forest':
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
                    Text(
                      AppStrings.get('title', currentLanguage),
                      style: const TextStyle(
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
                      child: Text(
                        AppStrings.get('start', currentLanguage),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: Colors.blue.shade50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            title: const Text(
                              '🌍 Dil Seçin / Select Language',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            content: SizedBox(
                              width: 400,
                              height: 500,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: AppLanguage.values.map((lang) {
                                    return _buildLanguageButton(context, lang);
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: AnimatedBuilder(
                        animation: _gradientController,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: _gradientAnimation.value * 2 * 3.14159,
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 3),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.3),
                                    blurRadius: 15,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  '🌍',
                                  style: TextStyle(fontSize: 50),
                                ),
                              ),
                            ),
                          );
                        },
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
                  child: Column(
                    children: [
                      Text(
                        AppStrings.get('selectCategory', currentLanguage),
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        AppStrings.get('whichAnimals', currentLanguage),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                _buildCategoryButton(
                  'pets',
                  AppStrings.get('pets', currentLanguage),
                  '🐱 🐕 🐦 🐰',
                  Colors.orange,
                ),
                const SizedBox(height: 25),
                _buildCategoryButton(
                  'farm',
                  AppStrings.get('farm', currentLanguage),
                  '🐄 🐴 🐑 🐓',
                  Colors.green,
                ),
                const SizedBox(height: 25),
                _buildCategoryButton(
                  'forest',
                  AppStrings.get('forest', currentLanguage),
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
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.refresh, size: 40, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    AppStrings.get('playAgain', currentLanguage),
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
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

  Widget _buildCategoryButton(String categoryKey, String title, String emojis, Color color) {
    return ElevatedButton(
      onPressed: () => selectCategory(categoryKey),
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

  Widget _buildLanguageButton(BuildContext context, AppLanguage lang) {
    bool isSelected = currentLanguage == lang;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            currentLanguage = lang;
          });
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${lang.flag} ${lang.name} seçildi!',
                style: const TextStyle(fontSize: 18),
              ),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 2),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.green : Colors.blue,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          minimumSize: const Size(250, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${lang.flag} ${lang.name}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            if (isSelected) const SizedBox(width: 10),
            if (isSelected) const Icon(Icons.check_circle, color: Colors.white, size: 22),
          ],
        ),
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
              child: Text(
                AppStrings.get('playAgainBtn', currentLanguage),
                style: const TextStyle(
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
