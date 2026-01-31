import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

// Dil enum'ı
enum AppLanguage {
  turkish('tr', 'Türkçe', '🇹🇷'),
  english('en', 'English', '🇬🇧'),
  greek('el', 'Ελληνικά', '🇬🇷'),
  bulgarian('bg', 'Български', '🇧🇬'),
  romanian('ro', 'Română', '🇷🇴'),
  serbian('sr', 'Српски', '🇷🇸'),
  croatian('hr', 'Hrvatski', '🇭🇷'),
  bosnian('bs', 'Bosanski', '🇧🇦'),
  albanian('sq', 'Shqip', '🇦🇱'),
  macedonian('mk', 'Македонски', '🇲🇰'),
  slovenian('sl', 'Slovenščina', '🇸🇮'),
  arabic('ar', 'العربية', '🇸🇦'),
  chinese('zh', '中文', '🇨🇳'),
  japanese('ja', '日本語', '🇯🇵'),
  korean('ko', '한국어', '🇰🇷'),
  hindi('hi', 'हिन्दी', '🇮🇳'),
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

// Dil servisi
class LocaleService extends ChangeNotifier {
  static const String _languageKey = 'selected_language';
  AppLanguage _currentLanguage = AppLanguage.turkish;

  AppLanguage get currentLanguage => _currentLanguage;
  Locale get locale => Locale(_currentLanguage.code);

  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_languageKey) ?? 'tr';
    _currentLanguage = AppLanguage.values.firstWhere(
      (lang) => lang.code == languageCode,
      orElse: () => AppLanguage.turkish,
    );
    notifyListeners();
  }

  Future<void> setLanguage(AppLanguage language) async {
    if (_currentLanguage != language) {
      _currentLanguage = language;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_languageKey, language.code);
      notifyListeners();
    }
  }
}

// String'ler
class AppStrings {
  final AppLanguage language;

  AppStrings(this.language);

  String get appTitle {
    switch (language) {
      case AppLanguage.turkish: return 'Hayvan Gölgeleri';
      case AppLanguage.english: return 'Animal Shadows';
      case AppLanguage.greek: return 'Σκιές Ζώων';
      case AppLanguage.bulgarian: return 'Сенки на животни';
      case AppLanguage.romanian: return 'Umbre de Animale';
      case AppLanguage.serbian: return 'Сенке животиња';
      case AppLanguage.croatian: return 'Sjene životinja';
      case AppLanguage.bosnian: return 'Sjene životinja';
      case AppLanguage.albanian: return 'Hijet e kafshëve';
      case AppLanguage.macedonian: return 'Сенки на животни';
      case AppLanguage.slovenian: return 'Sence živali';
      case AppLanguage.arabic: return 'ظلال الحيوانات';
      case AppLanguage.chinese: return '动物阴影';
      case AppLanguage.japanese: return '動物の影';
      case AppLanguage.korean: return '동물 그림자';
      case AppLanguage.hindi: return 'जानवरों की छाया';
      case AppLanguage.urdu: return 'جانوروں کے سائے';
      case AppLanguage.bengali: return 'প্রাণীর ছায়া';
      case AppLanguage.vietnamese: return 'Bóng động vật';
      case AppLanguage.thai: return 'เงาสัตว์';
      case AppLanguage.indonesian: return 'Bayangan Hewan';
      case AppLanguage.malay: return 'Bayang-bayang Haiwan';
      case AppLanguage.filipino: return 'Anino ng Hayop';
      case AppLanguage.persian: return 'سایه حیوانات';
      case AppLanguage.hebrew: return 'צללים של בעלי חיים';
    }
  }

  String get gameTitle {
    switch (language) {
      case AppLanguage.turkish: return '🎮 Hayvan Oyunu';
      case AppLanguage.english: return '🎮 Animal Game';
      case AppLanguage.greek: return '🎮 Παιχνίδι Ζώων';
      case AppLanguage.bulgarian: return '🎮 Игра с животни';
      case AppLanguage.romanian: return '🎮 Joc cu Animale';
      case AppLanguage.serbian: return '🎮 Игра животиња';
      case AppLanguage.croatian: return '🎮 Igra životinja';
      case AppLanguage.bosnian: return '🎮 Igra životinja';
      case AppLanguage.albanian: return '🎮 Loja e kafshëve';
      case AppLanguage.macedonian: return '🎮 Игра на животни';
      case AppLanguage.slovenian: return '🎮 Igra živali';
      case AppLanguage.arabic: return '🎮 لعبة الحيوانات';
      case AppLanguage.chinese: return '🎮 动物游戏';
      case AppLanguage.japanese: return '🎮 動物ゲーム';
      case AppLanguage.korean: return '🎮 동물 게임';
      case AppLanguage.hindi: return '🎮 जानवर खेल';
      case AppLanguage.urdu: return '🎮 جانوروں کا کھیل';
      case AppLanguage.bengali: return '🎮 প্রাণী খেলা';
      case AppLanguage.vietnamese: return '🎮 Trò chơi động vật';
      case AppLanguage.thai: return '🎮 เกมสัตว์';
      case AppLanguage.indonesian: return '🎮 Permainan Hewan';
      case AppLanguage.malay: return '🎮 Permainan Haiwan';
      case AppLanguage.filipino: return '🎮 Laro ng Hayop';
      case AppLanguage.persian: return '🎮 بازی حیوانات';
      case AppLanguage.hebrew: return '🎮 משחק בעלי חיים';
    }
  }

  String get matchAnimals {
    switch (language) {
      case AppLanguage.turkish: return '✨ Hayvanları eşleştir! ✨';
      case AppLanguage.english: return '✨ Match the animals! ✨';
      case AppLanguage.greek: return '✨ Ταίριαξε τα ζώα! ✨';
      case AppLanguage.bulgarian: return '✨ Свържи животните! ✨';
      case AppLanguage.romanian: return '✨ Potrivește animalele! ✨';
      case AppLanguage.serbian: return '✨ Упари животиње! ✨';
      case AppLanguage.croatian: return '✨ Spoji životinje! ✨';
      case AppLanguage.bosnian: return '✨ Spoji životinje! ✨';
      case AppLanguage.albanian: return '✨ Përputhi kafshët! ✨';
      case AppLanguage.macedonian: return '✨ Спои ги животните! ✨';
      case AppLanguage.slovenian: return '✨ Poveži živali! ✨';
      case AppLanguage.arabic: return '✨ !طابق الحيوانات ✨';
      case AppLanguage.chinese: return '✨ 配对动物！ ✨';
      case AppLanguage.japanese: return '✨ 動物をマッチしよう！ ✨';
      case AppLanguage.korean: return '✨ 동물을 매칭하세요! ✨';
      case AppLanguage.hindi: return '✨ जानवरों को मिलाएं! ✨';
      case AppLanguage.urdu: return '✨ !جانوروں کو ملائیں ✨';
      case AppLanguage.bengali: return '✨ প্রাণী মিলান করুন! ✨';
      case AppLanguage.vietnamese: return '✨ Ghép cặp động vật! ✨';
      case AppLanguage.thai: return '✨ จับคู่สัตว์! ✨';
      case AppLanguage.indonesian: return '✨ Cocokkan hewan! ✨';
      case AppLanguage.malay: return '✨ Padankan haiwan! ✨';
      case AppLanguage.filipino: return '✨ Itugma ang mga hayop! ✨';
      case AppLanguage.persian: return '✨ !حیوانات را تطبیق دهید ✨';
      case AppLanguage.hebrew: return '✨ !התאם את בעלי החיים ✨';
    }
  }

  String get playAgain {
    switch (language) {
      case AppLanguage.turkish: return 'Tekrar Oyna';
      case AppLanguage.english: return 'Play Again';
      case AppLanguage.greek: return 'Παίξε Ξανά';
      case AppLanguage.bulgarian: return 'Играй отново';
      case AppLanguage.romanian: return 'Joacă Din Nou';
      case AppLanguage.serbian: return 'Играј поново';
      case AppLanguage.croatian: return 'Igraj Ponovno';
      case AppLanguage.bosnian: return 'Igraj Ponovo';
      case AppLanguage.albanian: return 'Luaj Përsëri';
      case AppLanguage.macedonian: return 'Играј повторно';
      case AppLanguage.slovenian: return 'Igraj Znova';
      case AppLanguage.arabic: return 'العب مرة أخرى';
      case AppLanguage.chinese: return '再来一次';
      case AppLanguage.japanese: return 'もう一度';
      case AppLanguage.korean: return '다시 하기';
      case AppLanguage.hindi: return 'फिर से खेलें';
      case AppLanguage.urdu: return 'دوبارہ کھیلیں';
      case AppLanguage.bengali: return 'আবার খেলুন';
      case AppLanguage.vietnamese: return 'Chơi lại';
      case AppLanguage.thai: return 'เล่นอีกครั้ง';
      case AppLanguage.indonesian: return 'Main Lagi';
      case AppLanguage.malay: return 'Main Semula';
      case AppLanguage.filipino: return 'Maglaro Muli';
      case AppLanguage.persian: return 'دوبارہ بازی کنید';
      case AppLanguage.hebrew: return 'שחק שוב';
    }
  }

  String get congratulations {
    switch (language) {
      case AppLanguage.turkish: return 'YAŞASIN!';
      case AppLanguage.english: return 'HOORAY!';
      case AppLanguage.greek: return 'ΜΠΡΑΒΟ!';
      case AppLanguage.bulgarian: return 'БРАВО!';
      case AppLanguage.romanian: return 'BRAVO!';
      case AppLanguage.serbian: return 'БРАВО!';
      case AppLanguage.croatian: return 'BRAVO!';
      case AppLanguage.bosnian: return 'BRAVO!';
      case AppLanguage.albanian: return 'BRAVO!';
      case AppLanguage.macedonian: return 'БРАВО!';
      case AppLanguage.slovenian: return 'BRAVO!';
      case AppLanguage.arabic: return '!يا هلا';
      case AppLanguage.chinese: return '太棒了！';
      case AppLanguage.japanese: return 'やったー！';
      case AppLanguage.korean: return '만세！';
      case AppLanguage.hindi: return 'शाबाश！';
      case AppLanguage.urdu: return '!شاباش';
      case AppLanguage.bengali: return 'বাহ！';
      case AppLanguage.vietnamese: return 'Tốt lắm!';
      case AppLanguage.thai: return 'เยี่ยม!';
      case AppLanguage.indonesian: return 'Hore!';
      case AppLanguage.malay: return 'Tahniah!';
      case AppLanguage.filipino: return 'Mabuhay!';
      case AppLanguage.persian: return '!آفرین';
      case AppLanguage.hebrew: return '!היי';
    }
  }

  String get allMatched {
    switch (language) {
      case AppLanguage.turkish: return 'Tüm hayvanları\nbuldun!';
      case AppLanguage.english: return 'You found all\nanimals!';
      case AppLanguage.greek: return 'Βρήκες όλα\nτα ζώα!';
      case AppLanguage.bulgarian: return 'Намери всички\nживотни!';
      case AppLanguage.romanian: return 'Ai găsit toate\nanimalele!';
      case AppLanguage.serbian: return 'Пронашао си све\nживотиње!';
      case AppLanguage.croatian: return 'Pronašao si sve\nživotinje!';
      case AppLanguage.bosnian: return 'Pronašao si sve\nživotinje!';
      case AppLanguage.albanian: return 'I gjete të gjitha\nkafshët!';
      case AppLanguage.macedonian: return 'Ги најде сите\nживотни!';
      case AppLanguage.slovenian: return 'Našel si vse\nživali!';
      case AppLanguage.arabic: return '!وجدت جميع\nالحيوانات';
      case AppLanguage.chinese: return '你找到了\n所有动物！';
      case AppLanguage.japanese: return '全部の動物を\n見つけたよ！';
      case AppLanguage.korean: return '모든 동물을\n찾았어요！';
      case AppLanguage.hindi: return 'आपने सभी\nजानवर ढूंढे！';
      case AppLanguage.urdu: return 'آپ نے سب\nجانور ڈھونڈے！';
      case AppLanguage.bengali: return 'আপনি সব\nপ্রাণী খুঁজে পেয়েছেন！';
      case AppLanguage.vietnamese: return 'Bạn đã tìm\ntất cả động vật!';
      case AppLanguage.thai: return 'คุณหาสัตว์\nทั้งหมดแล้ว！';
      case AppLanguage.indonesian: return 'Kamu menemukan\nsemua hewan!';
      case AppLanguage.malay: return 'Anda jumpa semua\nhaiwan!';
      case AppLanguage.filipino: return 'Nahanap mo ang\nlahat ng hayop!';
      case AppLanguage.persian: return 'همه حیوانات را\nپیدا کردی！';
      case AppLanguage.hebrew: return 'מצאת את כל\nבעלי החיים！';
    }
  }

  String get playAgainButton {
    switch (language) {
      case AppLanguage.turkish: return 'Tekrar Oyna! 🎮';
      case AppLanguage.english: return 'Play Again! 🎮';
      case AppLanguage.greek: return 'Παίξε Ξανά! 🎮';
      case AppLanguage.bulgarian: return 'Играй отново! 🎮';
      case AppLanguage.romanian: return 'Joacă Din Nou! 🎮';
      case AppLanguage.serbian: return 'Играј поново! 🎮';
      case AppLanguage.croatian: return 'Igraj Ponovno! 🎮';
      case AppLanguage.bosnian: return 'Igraj Ponovo! 🎮';
      case AppLanguage.albanian: return 'Luaj Përsëri! 🎮';
      case AppLanguage.macedonian: return 'Играј повторно! 🎮';
      case AppLanguage.slovenian: return 'Igraj Znova! 🎮';
      case AppLanguage.arabic: return '!العب مرة أخرى 🎮';
      case AppLanguage.chinese: return '再来一次！ 🎮';
      case AppLanguage.japanese: return 'もう一度！ 🎮';
      case AppLanguage.korean: return '다시 하기！ 🎮';
      case AppLanguage.hindi: return 'फिर से खेलें！ 🎮';
      case AppLanguage.urdu: return '!دوبارہ کھیلیں 🎮';
      case AppLanguage.bengali: return 'আবার খেলুন！ 🎮';
      case AppLanguage.vietnamese: return 'Chơi lại! 🎮';
      case AppLanguage.thai: return 'เล่นอีกครั้ง！ 🎮';
      case AppLanguage.indonesian: return 'Main Lagi! 🎮';
      case AppLanguage.malay: return 'Main Semula! 🎮';
      case AppLanguage.filipino: return 'Maglaro Muli! 🎮';
      case AppLanguage.persian: return '!دوبارہ بازی کنید 🎮';
      case AppLanguage.hebrew: return '!שחק שוב 🎮';
    }
  }

  String get settings {
    switch (language) {
      case AppLanguage.turkish: return 'Ayarlar';
      case AppLanguage.english: return 'Settings';
      case AppLanguage.greek: return 'Ρυθμίσεις';
      case AppLanguage.bulgarian: return 'Настройки';
      case AppLanguage.romanian: return 'Setări';
      case AppLanguage.serbian: return 'Подешавања';
      case AppLanguage.croatian: return 'Postavke';
      case AppLanguage.bosnian: return 'Postavke';
      case AppLanguage.albanian: return 'Cilësimet';
      case AppLanguage.macedonian: return 'Поставки';
      case AppLanguage.slovenian: return 'Nastavitve';
      case AppLanguage.arabic: return 'الإعدادات';
      case AppLanguage.chinese: return '设置';
      case AppLanguage.japanese: return '設定';
      case AppLanguage.korean: return '설정';
      case AppLanguage.hindi: return 'सेटिंग';
      case AppLanguage.urdu: return 'ترتیبات';
      case AppLanguage.bengali: return 'সেটিংস';
      case AppLanguage.vietnamese: return 'Cài đặt';
      case AppLanguage.thai: return 'การตั้งค่า';
      case AppLanguage.indonesian: return 'Pengaturan';
      case AppLanguage.malay: return 'Tetapan';
      case AppLanguage.filipino: return 'Mga Setting';
      case AppLanguage.persian: return 'تنظیمات';
      case AppLanguage.hebrew: return 'הגדרות';
    }
  }

  String get selectLanguage {
    switch (language) {
      case AppLanguage.turkish: return 'Dil Seçin';
      case AppLanguage.english: return 'Select Language';
      case AppLanguage.greek: return 'Επιλέξτε Γλώσσα';
      case AppLanguage.bulgarian: return 'Изберете език';
      case AppLanguage.romanian: return 'Selectați Limba';
      case AppLanguage.serbian: return 'Изаберите језик';
      case AppLanguage.croatian: return 'Odaberite jezik';
      case AppLanguage.bosnian: return 'Odaberite jezik';
      case AppLanguage.albanian: return 'Zgjidhni gjuhën';
      case AppLanguage.macedonian: return 'Изберете јазик';
      case AppLanguage.slovenian: return 'Izberite jezik';
      case AppLanguage.arabic: return 'اختر اللغة';
      case AppLanguage.chinese: return '选择语言';
      case AppLanguage.japanese: return '言語を選択';
      case AppLanguage.korean: return '언어 선택';
      case AppLanguage.hindi: return 'भाषा चुनें';
      case AppLanguage.urdu: return 'زبان منتخب کریں';
      case AppLanguage.bengali: return 'ভাষা নির্বাচন করুন';
      case AppLanguage.vietnamese: return 'Chọn ngôn ngữ';
      case AppLanguage.thai: return 'เลือกภาษา';
      case AppLanguage.indonesian: return 'Pilih Bahasa';
      case AppLanguage.malay: return 'Pilih Bahasa';
      case AppLanguage.filipino: return 'Pumili ng Wika';
      case AppLanguage.persian: return 'انتخاب زبان';
      case AppLanguage.hebrew: return 'בחר שפה';
    }
  }

  // Hayvan isimleri
  String get cat {
    switch (language) {
      case AppLanguage.turkish: return 'Kedi';
      case AppLanguage.english: return 'Cat';
      case AppLanguage.greek: return 'Γάτα';
      case AppLanguage.bulgarian: return 'Котка';
      case AppLanguage.romanian: return 'Pisică';
      case AppLanguage.serbian: return 'Мачка';
      case AppLanguage.croatian: return 'Mačka';
      case AppLanguage.bosnian: return 'Mačka';
      case AppLanguage.albanian: return 'Mace';
      case AppLanguage.macedonian: return 'Мачка';
      case AppLanguage.slovenian: return 'Mačka';
      case AppLanguage.arabic: return 'قطة';
      case AppLanguage.chinese: return '猫';
      case AppLanguage.japanese: return '猫';
      case AppLanguage.korean: return '고양이';
      case AppLanguage.hindi: return 'बिल्ली';
      case AppLanguage.urdu: return 'بلی';
      case AppLanguage.bengali: return 'বিড়াল';
      case AppLanguage.vietnamese: return 'Mèo';
      case AppLanguage.thai: return 'แมว';
      case AppLanguage.indonesian: return 'Kucing';
      case AppLanguage.malay: return 'Kucing';
      case AppLanguage.filipino: return 'Pusa';
      case AppLanguage.persian: return 'گربه';
      case AppLanguage.hebrew: return 'חתול';
    }
  }

  String get dog {
    switch (language) {
      case AppLanguage.turkish: return 'Köpek';
      case AppLanguage.english: return 'Dog';
      case AppLanguage.greek: return 'Σκύλος';
      case AppLanguage.bulgarian: return 'Куче';
      case AppLanguage.romanian: return 'Câine';
      case AppLanguage.serbian: return 'Пас';
      case AppLanguage.croatian: return 'Pas';
      case AppLanguage.bosnian: return 'Pas';
      case AppLanguage.albanian: return 'Qen';
      case AppLanguage.macedonian: return 'Куче';
      case AppLanguage.slovenian: return 'Pes';
      case AppLanguage.arabic: return 'كلب';
      case AppLanguage.chinese: return '狗';
      case AppLanguage.japanese: return '犬';
      case AppLanguage.korean: return '개';
      case AppLanguage.hindi: return 'कुत्ता';
      case AppLanguage.urdu: return 'کتا';
      case AppLanguage.bengali: return 'কুকুর';
      case AppLanguage.vietnamese: return 'Chó';
      case AppLanguage.thai: return 'สุนัข';
      case AppLanguage.indonesian: return 'Anjing';
      case AppLanguage.malay: return 'Anjing';
      case AppLanguage.filipino: return 'Aso';
      case AppLanguage.persian: return 'سگ';
      case AppLanguage.hebrew: return 'כלב';
    }
  }

  String get bird {
    switch (language) {
      case AppLanguage.turkish: return 'Kuş';
      case AppLanguage.english: return 'Bird';
      case AppLanguage.greek: return 'Πουλί';
      case AppLanguage.bulgarian: return 'Птица';
      case AppLanguage.romanian: return 'Pasăre';
      case AppLanguage.serbian: return 'Птица';
      case AppLanguage.croatian: return 'Ptica';
      case AppLanguage.bosnian: return 'Ptica';
      case AppLanguage.albanian: return 'Zog';
      case AppLanguage.macedonian: return 'Птица';
      case AppLanguage.slovenian: return 'Ptica';
      case AppLanguage.arabic: return 'طائر';
      case AppLanguage.chinese: return '鸟';
      case AppLanguage.japanese: return '鳥';
      case AppLanguage.korean: return '새';
      case AppLanguage.hindi: return 'चिड़िया';
      case AppLanguage.urdu: return 'چڑیا';
      case AppLanguage.bengali: return 'পাখি';
      case AppLanguage.vietnamese: return 'Chim';
      case AppLanguage.thai: return 'นก';
      case AppLanguage.indonesian: return 'Burung';
      case AppLanguage.malay: return 'Burung';
      case AppLanguage.filipino: return 'Ibon';
      case AppLanguage.persian: return 'پرنده';
      case AppLanguage.hebrew: return 'ציפור';
    }
  }

  String get rabbit {
    switch (language) {
      case AppLanguage.turkish: return 'Tavşan';
      case AppLanguage.english: return 'Rabbit';
      case AppLanguage.greek: return 'Κουνέλι';
      case AppLanguage.bulgarian: return 'Заек';
      case AppLanguage.romanian: return 'Iepure';
      case AppLanguage.serbian: return 'Зец';
      case AppLanguage.croatian: return 'Zec';
      case AppLanguage.bosnian: return 'Zec';
      case AppLanguage.albanian: return 'Lepur';
      case AppLanguage.macedonian: return 'Зајак';
      case AppLanguage.slovenian: return 'Zajec';
      case AppLanguage.arabic: return 'أرنب';
      case AppLanguage.chinese: return '兔子';
      case AppLanguage.japanese: return 'ウサギ';
      case AppLanguage.korean: return '토끼';
      case AppLanguage.hindi: return 'खरगोश';
      case AppLanguage.urdu: return 'خرگوش';
      case AppLanguage.bengali: return 'খরগোশ';
      case AppLanguage.vietnamese: return 'Thỏ';
      case AppLanguage.thai: return 'กระต่าย';
      case AppLanguage.indonesian: return 'Kelinci';
      case AppLanguage.malay: return 'Arnab';
      case AppLanguage.filipino: return 'Kuneho';
      case AppLanguage.persian: return 'خرگوش';
      case AppLanguage.hebrew: return 'ארנב';
    }
  }

  // Başarı mesajları
  List<String> get successMessages {
    switch (language) {
      case AppLanguage.turkish:
        return [
          '🎉 Aferin! Çok güzel!',
          '⭐ Harika! Süpersin!',
          '🌟 Bravo! Doğru!',
          '💚 Tebrikler! Mükemmel!',
        ];
      case AppLanguage.english:
        return [
          '🎉 Great! Well done!',
          '⭐ Amazing! You\'re awesome!',
          '🌟 Bravo! Correct!',
          '💚 Congratulations! Perfect!',
        ];
      case AppLanguage.greek:
        return [
          '🎉 Μπράβο! Υπέροχα!',
          '⭐ Καταπληκτικό! Είσαι φοβερός!',
          '🌟 Μπράβο! Σωστό!',
          '💚 Συγχαρητήρια! Τέλειο!',
        ];
      case AppLanguage.bulgarian:
        return [
          '🎉 Браво! Много добре!',
          '⭐ Страхотно! Супер си!',
          '🌟 Браво! Вярно!',
          '💚 Поздравления! Перфектно!',
        ];
      case AppLanguage.romanian:
        return [
          '🎉 Bravo! Foarte bine!',
          '⭐ Minunat! Ești grozav!',
          '🌟 Bravo! Corect!',
          '💚 Felicitări! Perfect!',
        ];
      case AppLanguage.serbian:
        return [
          '🎉 Браво! Одлично!',
          '⭐ Супер! Сјајан си!',
          '🌟 Браво! Тачно!',
          '💚 Честитамо! Савршено!',
        ];
      case AppLanguage.croatian:
        return [
          '🎉 Bravo! Vrlo dobro!',
          '⭐ Super! Odličan si!',
          '🌟 Bravo! Točno!',
          '💚 Čestitam! Savršeno!',
        ];
      case AppLanguage.bosnian:
        return [
          '🎉 Bravo! Vrlo dobro!',
          '⭐ Super! Odličan si!',
          '🌟 Bravo! Tačno!',
          '💚 Čestitam! Savršeno!',
        ];
      case AppLanguage.albanian:
        return [
          '🎉 Bravo! Shumë mirë!',
          '⭐ Mahnitëse! Je i shkëlqyer!',
          '🌟 Bravo! Saktë!',
          '💚 Urime! Perfekt!',
        ];
      case AppLanguage.macedonian:
        return [
          '🎉 Браво! Многу добро!',
          '⭐ Супер! Одличен си!',
          '🌟 Браво! Точно!',
          '💚 Честитки! Совршено!',
        ];
      case AppLanguage.slovenian:
        return [
          '🎉 Bravo! Zelo dobro!',
          '⭐ Odlično! Si super!',
          '🌟 Bravo! Pravilno!',
          '💚 Čestitke! Popolno!',
        ];
      case AppLanguage.arabic:
        return [
          '🎉 !رائع! أحسنت',
          '⭐ !مذهل! أنت رائع',
          '🌟 !برافو! صحيح',
          '💚 !مبروك! ممتاز',
        ];
      case AppLanguage.chinese:
        return [
          '🎉 太棒了！做得好！',
          '⭐ 好棒！你真厉害！',
          '🌟 太好了！正确！',
          '💚 祝贺你！完美！',
        ];
      case AppLanguage.japanese:
        return [
          '🎉 すごい！よくできました！',
          '⭐ すばらしい！最高！',
          '🌟 やった！正解！',
          '💚 おめでとう！完璧！',
        ];
      case AppLanguage.korean:
        return [
          '🎉 훌륭해요！ 잘했어요！',
          '⭐ 대단해요！ 최고예요！',
          '🌟 바로 그거예요！ 정답！',
          '💚 축하해요！ 완벽해요！',
        ];
      case AppLanguage.hindi:
        return [
          '🎉 बहुत अच्छा！ शाबाश！',
          '⭐ कमाल है！ आप शानदार हैं！',
          '🌟 बहुत बढ़िया！ सही！',
          '💚 बधाई हो！ परफेक्ट！',
        ];
      case AppLanguage.urdu:
        return [
          '🎉 بہت اچھا！ شاباش！',
          '⭐ زبردست！ آپ شاندار ہیں！',
          '🌟 بہت خوب！ صحیح！',
          '💚 مبارک ہو！ بہترین！',
        ];
      case AppLanguage.bengali:
        return [
          '🎉 খুব ভালো！ সাবাশ！',
          '⭐ অসাধারণ！ আপনি দুর্দান্ত！',
          '🌟 খুব ভালো！ ঠিক！',
          '💚 অভিনন্দন！ নিখুঁত！',
        ];
      case AppLanguage.vietnamese:
        return [
          '🎉 Tuyệt vời! Làm tốt lắm!',
          '⭐ Tuyệt quá! Bạn giỏi quá!',
          '🌟 Tuyệt! Đúng rồi!',
          '💚 Chúc mừng! Hoàn hảo!',
        ];
      case AppLanguage.thai:
        return [
          '🎉 เยี่ยม! ทำได้ดี!',
          '⭐ สุดยอด! คุณเก่งมาก!',
          '🌟 เยี่ยม! ถูกต้อง!',
          '💚 ยินดี! สมบูรณ์แบบ!',
        ];
      case AppLanguage.indonesian:
        return [
          '🎉 Bagus! Kerja bagus!',
          '⭐ Luar biasa! Kamu hebat!',
          '🌟 Bagus! Benar!',
          '💚 Selamat! Sempurna!',
        ];
      case AppLanguage.malay:
        return [
          '🎉 Bagus! Kerja bagus!',
          '⭐ Hebat! Kamu terbaik!',
          '🌟 Bagus! Betul!',
          '💚 Tahniah! Sempurna!',
        ];
      case AppLanguage.filipino:
        return [
          '🎉 Magaling! Ang galing mo!',
          '⭐ Kamangha-mangha! Ang galing mo!',
          '🌟 Magaling! Tama!',
          '💚 Binabati kita! Perpekto!',
        ];
      case AppLanguage.persian:
        return [
          '🎉 عالی! آفرین!',
          '⭐ فوق العاده! عالی هستی!',
          '🌟 عالی! درسته!',
          '💚 تبریک! عالی!',
        ];
      case AppLanguage.hebrew:
        return [
          '🎉 מצוין! עבודה טובה!',
          '⭐ מדהים! אתה מעולה!',
          '🌟 מעולה! נכון!',
          '💚 כל הכבוד! מושלם!',
        ];
    }
  }

  // Hata mesajları
  List<String> get errorMessages {
    switch (language) {
      case AppLanguage.turkish:
        return [
          '😊 Tekrar dene!',
          '🤔 Başka hayvan dene!',
          '💭 Doğru olanı bul!',
        ];
      case AppLanguage.english:
        return [
          '😊 Try again!',
          '🤔 Try another animal!',
          '💭 Find the right one!',
        ];
      case AppLanguage.greek:
        return [
          '😊 Δοκίμασε ξανά!',
          '🤔 Δοκίμασε άλλο ζώο!',
          '💭 Βρες το σωστό!',
        ];
      case AppLanguage.bulgarian:
        return [
          '😊 Опитай пак!',
          '🤔 Опитай друго животно!',
          '💭 Намери правилното!',
        ];
      case AppLanguage.romanian:
        return [
          '😊 Încearcă din nou!',
          '🤔 Încearcă alt animal!',
          '💭 Găsește pe cel potrivit!',
        ];
      case AppLanguage.serbian:
        return [
          '😊 Покушај поново!',
          '🤔 Покушај другу животињу!',
          '💭 Нађи праву!',
        ];
      case AppLanguage.croatian:
        return [
          '😊 Pokušaj ponovno!',
          '🤔 Pokušaj drugu životinju!',
          '💭 Pronađi pravu!',
        ];
      case AppLanguage.bosnian:
        return [
          '😊 Pokušaj ponovo!',
          '🤔 Pokušaj drugu životinju!',
          '💭 Pronađi pravu!',
        ];
      case AppLanguage.albanian:
        return [
          '😊 Provo përsëri!',
          '🤔 Provo një kafshë tjetër!',
          '💭 Gjej të saktën!',
        ];
      case AppLanguage.macedonian:
        return [
          '😊 Обиди се повторно!',
          '🤔 Обиди се со друго животно!',
          '💭 Најди го точното!',
        ];
      case AppLanguage.slovenian:
        return [
          '😊 Poskusi znova!',
          '🤔 Poskusi drugo žival!',
          '💭 Najdi pravo!',
        ];
      case AppLanguage.arabic:
        return [
          '😊 !حاول مرة أخرى',
          '🤔 !جرب حيوان آخر',
          '💭 !ابحث عن الصحيح',
        ];
      case AppLanguage.chinese:
        return [
          '😊 再试一次！',
          '🤔 试试其他动物！',
          '💭 找到正确的！',
        ];
      case AppLanguage.japanese:
        return [
          '😊 もう一度やってみよう！',
          '🤔 別の動物を試してみて！',
          '💭 正しいのを見つけて！',
        ];
      case AppLanguage.korean:
        return [
          '😊 다시 해봐요！',
          '🤔 다른 동물을 시도해보세요！',
          '💭 올바른 것을 찾아보세요！',
        ];
      case AppLanguage.hindi:
        return [
          '😊 फिर से कोशिश करें！',
          '🤔 दूसरा जानवर आजमाएं！',
          '💭 सही वाला ढूंढें！',
        ];
      case AppLanguage.urdu:
        return [
          '😊 دوبارہ کوشش کریں！',
          '🤔 دوسرا جانور آزمائیں！',
          '💭 صحیح والا تلاش کریں！',
        ];
      case AppLanguage.bengali:
        return [
          '😊 আবার চেষ্টা করুন！',
          '🤔 অন্য প্রাণী চেষ্টা করুন！',
          '💭 সঠিকটি খুঁজুন！',
        ];
      case AppLanguage.vietnamese:
        return [
          '😊 Thử lại nhé!',
          '🤔 Thử động vật khác!',
          '💭 Tìm đúng cái!',
        ];
      case AppLanguage.thai:
        return [
          '😊 ลองอีกครั้ง!',
          '🤔 ลองสัตว์ตัวอื่น!',
          '💭 หาตัวที่ถูกต้อง!',
        ];
      case AppLanguage.indonesian:
        return [
          '😊 Coba lagi!',
          '🤔 Coba hewan lain!',
          '💭 Temukan yang benar!',
        ];
      case AppLanguage.malay:
        return [
          '😊 Cuba lagi!',
          '🤔 Cuba haiwan lain!',
          '💭 Cari yang betul!',
        ];
      case AppLanguage.filipino:
        return [
          '😊 Subukan muli!',
          '🤔 Subukan ang ibang hayop!',
          '💭 Hanapin ang tama!',
        ];
      case AppLanguage.persian:
        return [
          '😊 دوباره امتحان کن!',
          '🤔 حیوان دیگری امتحان کن!',
          '💭 درست را پیدا کن!',
        ];
      case AppLanguage.hebrew:
        return [
          '😊 נסה שוב!',
          '🤔 נסה בעל חיים אחר!',
          '💭 מצא את הנכון!',
        ];
    }
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LocaleService _localeService = LocaleService();

  @override
  void initState() {
    super.initState();
    _localeService.loadLanguage();
    _localeService.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _localeService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings(_localeService.currentLanguage);
    return MaterialApp(
      title: strings.appTitle,
      debugShowCheckedModeBanner: false,
      locale: _localeService.locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: AnimalShadowGame(localeService: _localeService),
    );
  }
}

class AnimalShadowGame extends StatefulWidget {
  final LocaleService localeService;

  const AnimalShadowGame({super.key, required this.localeService});

  @override
  State<AnimalShadowGame> createState() => _AnimalShadowGameState();
}

class _AnimalShadowGameState extends State<AnimalShadowGame> {
  List<Animal> get animals {
    final strings = AppStrings(widget.localeService.currentLanguage);
    return [
      Animal(strings.cat, '🐱', Colors.orange),
      Animal(strings.dog, '🐕', Colors.brown),
      Animal(strings.bird, '🐦', Colors.blue),
      Animal(strings.rabbit, '🐰', Colors.pink),
    ];
  }

  Map<String, String?> placedAnimals = {};
  int correctMatches = 0;
  List<Animal> shuffledAnimals = [];
  List<Animal> shadowTargets = [];

  @override
  void initState() {
    super.initState();
    widget.localeService.addListener(_onLanguageChanged);
    startNewGame();
  }

  @override
  void dispose() {
    widget.localeService.removeListener(_onLanguageChanged);
    super.dispose();
  }

  void _onLanguageChanged() {
    startNewGame();
  }

  void startNewGame() {
    setState(() {
      placedAnimals.clear();
      correctMatches = 0;
      shuffledAnimals = List.from(animals)..shuffle();
      shadowTargets = List.from(animals)..shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings(widget.localeService.currentLanguage);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          strings.gameTitle,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple.shade300,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, size: 30),
            onPressed: () => _showLanguageDialog(context, strings),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.pink.shade100,
              Colors.yellow.shade100,
              Colors.blue.shade100,
              Colors.green.shade100,
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                strings.matchAnimals,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            // Sürüklenebilir hayvanlar - Daha büyük
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
            
            // Gölge hedefleri - Daha büyük
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
                        _showSuccessDialog();
                        
                        // Tüm hayvanlar yerleştirildi mi?
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
                    strings.playAgain,
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

  void _showSuccessDialog() {
    final strings = AppStrings(widget.localeService.currentLanguage);
    final messages = strings.successMessages;
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
    final strings = AppStrings(widget.localeService.currentLanguage);
    final messages = strings.errorMessages;
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
    final strings = AppStrings(widget.localeService.currentLanguage);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.yellow.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(color: Colors.orange, width: 5),
        ),
        title: Column(
          children: [
            const Text(
              '🎉🎊🏆',
              style: TextStyle(fontSize: 50),
            ),
            const SizedBox(height: 10),
            Text(
              strings.congratulations,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              strings.allMatched,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
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
                strings.playAgainButton,
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

  void _showLanguageDialog(BuildContext context, AppStrings strings) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.blue.shade50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(color: Colors.blue.shade300, width: 3),
        ),
        title: Text(
          strings.selectLanguage,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: AppLanguage.values.map((language) {
            final isSelected = widget.localeService.currentLanguage == language;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ElevatedButton(
                onPressed: () {
                  widget.localeService.setLanguage(language);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Colors.green : Colors.blue.shade200,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: const Size(200, 60),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      language.flag,
                      style: const TextStyle(fontSize: 30),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      language.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    if (isSelected) ..[
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.check_circle,
                        color: Colors.white,
                        size: 25,
                      ),
                    ],
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Animal {
  final String name;
  final String emoji;
  final Color color;

  Animal(this.name, this.emoji, this.color);
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
          const SizedBox(height: 5),
          Text(
            animal.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black87,
            ),
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
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  animal.emoji,
                  style: const TextStyle(fontSize: 70),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  animal.emoji,
                  style: TextStyle(
                    fontSize: 70,
                    color: Colors.black.withOpacity(0.15),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    '?',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}