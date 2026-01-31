# Uygulama İkonu Oluşturma Rehberi

## Mevcut İkonlar

Şu anda Flutter'ın varsayılan ikonu kullanılıyor.

## Özel İkon Oluşturmak İçin

### Seçenek 1: Online İkon Oluşturucu (Önerilen - Kolay)

1. **Canva** veya **Icon Kitchen** kullanarak bir ikon tasarlayın
2. 1024x1024 PNG formatında kaydedin
3. https://www.appicon.co/ adresine gidin
4. 1024x1024 ikonunuzu yükleyin
5. Android için tüm boyutları indirin

### Seçenek 2: Flutter Launcher Icons Paketi (Otomatik)

1. `pubspec.yaml` dosyasına ekleyin:

```yaml
dev_dependencies:
  flutter_launcher_icons: ^0.13.1

flutter_launcher_icons:
  android: true
  ios: false
  image_path: "assets/icon/app_icon.png"
  adaptive_icon_background: "#FFFFFF"
  adaptive_icon_foreground: "assets/icon/app_icon.png"
```

2. `assets/icon/` klasörüne 1024x1024 PNG ikonunuzu ekleyin

3. Komutu çalıştırın:
```bash
flutter pub get
flutter pub run flutter_launcher_icons
```

## İkon Tasarım Önerileri

Hayvan temalı oyun için ikon fikirleri:
- 🐾 Renkli pati izi
- 🎮 Oyun kumandası + hayvan
- 🐱🐕 İki sevimli hayvan
- 🌈 Gökkuşağı renkleri + hayvan silueti

### Tasarım Kuralları:
- Basit ve anlaşılır olmalı
- Küçük boyutlarda bile okunabilir olmalı
- Renkli ve dikkat çekici
- Çocuklara hitap eden tasarım
- Arka plan şeffaf veya düz renk

## Gerekli İkon Boyutları (Android)

- mipmap-mdpi: 48x48
- mipmap-hdpi: 72x72
- mipmap-xhdpi: 96x96
- mipmap-xxhdpi: 144x144
- mipmap-xxxhdpi: 192x192

## Mevcut İkon Konumu

Android: `android/app/src/main/res/mipmap-*/ic_launcher.png`

## İkon Değiştirme (Manuel)

Eğer hazır ikonlarınız varsa:

1. Her boyut için PNG dosyalarını hazırlayın
2. İlgili mipmap klasörlerine kopyalayın:
   - `android/app/src/main/res/mipmap-mdpi/ic_launcher.png`
   - `android/app/src/main/res/mipmap-hdpi/ic_launcher.png`
   - vb.

3. Uygulamayı yeniden build edin

## Adaptive İkon (Android 8.0+)

Modern Android cihazlar için adaptive ikon kullanılmalı:
- Foreground: İkon görseli (şeffaf arka plan)
- Background: Arka plan rengi veya görseli

Konum: `android/app/src/main/res/mipmap-anydpi-v26/ic_launcher.xml`

## Not

İkon değişikliği sonrası mutlaka yeniden build yapılmalıdır:
```bash
flutter clean
flutter build apk --release
```
