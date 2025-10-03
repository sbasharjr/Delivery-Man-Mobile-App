# Quick Start Guide - MyGetWell Delivery Man App

This guide will help you get the app up and running in minutes.

## Prerequisites Check

```bash
# Check Flutter installation
flutter doctor

# You should see:
# ✓ Flutter (version 3.0.0 or higher)
# ✓ Android toolchain (for Android development)
# ✓ Xcode (for iOS development - macOS only)
```

## Installation (5 minutes)

### Step 1: Clone the Repository
```bash
git clone https://github.com/sbasharjr/Vendor-Mobile-App.git
cd Vendor-Mobile-App
```

### Step 2: Install Dependencies
```bash
flutter pub get
```

### Step 3: Configure API (Optional)
Edit `lib/services/api_service.dart` to point to your backend:
```dart
static const String baseUrl = 'https://mygetwell.app/api';
```

### Step 4: Run the App
```bash
# For Android
flutter run

# For iOS (macOS only)
flutter run -d ios

# For web (testing only)
flutter run -d chrome
```

## First Launch

When you first launch the app, you'll see:
1. **Splash Screen** - 2 second loading animation
2. **Login Screen** - Enter credentials to continue

### Demo Credentials (if available)
```
Email: delivery@example.com
Password: password123
```

## Project Structure at a Glance

```
Vendor-Mobile-App/
├── lib/
│   ├── main.dart              # Start here!
│   ├── screens/               # All app screens
│   ├── models/                # Data structures
│   ├── providers/             # State management
│   ├── services/              # API & storage
│   └── widgets/               # Reusable components
├── test/                      # Unit tests
├── android/                   # Android config
├── ios/                       # iOS config
└── assets/                    # Images & icons
```

## Common Commands

```bash
# Run the app
flutter run

# Run tests
flutter test

# Check for issues
flutter analyze

# Format code
dart format lib/

# Build APK (Android)
flutter build apk --release

# Build iOS
flutter build ios --release

# Clean build files
flutter clean
```

## Key Features to Try

1. **Login** - Secure authentication system
2. **Dashboard** - View order statistics at a glance
3. **Orders** - Browse pending, active, and completed orders
4. **Order Details** - Tap any order to see full details
5. **Status Updates** - Update delivery status with one tap
6. **Call Customer** - Direct phone integration
7. **Navigate** - Open Google Maps for directions
8. **Profile** - View and manage your profile

## Troubleshooting

### "No device found"
```bash
# List available devices
flutter devices

# For Android emulator
flutter emulators --launch <emulator_id>
```

### "Package not found" errors
```bash
flutter clean
flutter pub get
```

### Build errors
```bash
flutter clean
cd android && ./gradlew clean && cd ..
flutter pub get
flutter run
```

### iOS build issues (macOS)
```bash
cd ios
pod install
cd ..
flutter run
```

## Development Workflow

1. Make changes to code
2. Hot reload with `r` in terminal (or Ctrl+S in IDE)
3. Test functionality
4. Run `flutter analyze` to check for issues
5. Commit changes

## Next Steps

- Read [README.md](README.md) for detailed documentation
- Check [ARCHITECTURE.md](ARCHITECTURE.md) to understand the design
- Review [CONTRIBUTING.md](CONTRIBUTING.md) for development guidelines
- Explore the code starting from `lib/main.dart`

## Need Help?

- Check existing issues on GitHub
- Review the documentation files
- Contact the development team

## Useful Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Provider Package](https://pub.dev/packages/provider)
- [Flutter Cookbook](https://flutter.dev/docs/cookbook)

---

**Ready to deliver!** 🚀
