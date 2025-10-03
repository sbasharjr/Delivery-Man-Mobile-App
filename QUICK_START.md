# Quick Start Guide - MyGetWell Vendor App

## Prerequisites Check

Before you begin, ensure you have:
- [ ] Flutter SDK installed (https://flutter.dev/docs/get-started/install)
- [ ] Android Studio or Xcode installed
- [ ] An Android emulator or iOS simulator set up
- [ ] Git installed

## Quick Setup (5 minutes)

### Step 1: Clone and Install
```bash
# Clone the repository
git clone https://github.com/sbasharjr/Vendor-Mobile-App.git
cd Vendor-Mobile-App

# Install dependencies
flutter pub get
```

### Step 2: Verify Installation
```bash
# Check if Flutter is properly installed
flutter doctor

# Analyze the project
flutter analyze
```

### Step 3: Run the App
```bash
# List available devices
flutter devices

# Run on connected device/emulator
flutter run

# Or run in debug mode with hot reload
flutter run --debug
```

### Step 4: Test Login
1. The app will open with a splash screen
2. You'll be redirected to the login screen
3. Enter any email (e.g., vendor@mygetwell.app)
4. Enter any password (min 6 characters, e.g., password123)
5. Click "Login"

You're now in the vendor dashboard!

## App Navigation

### 🏠 Dashboard Tab
- View statistics (Orders, Revenue, Products)
- See recent orders
- Quick overview of your business

### 📦 Orders Tab
- View all customer orders
- Check order status
- See order details

### 🏪 Products Tab
- View your product inventory
- Check stock levels
- See product pricing

### 👤 Profile Tab
- View your vendor information
- Access settings
- Logout

## Testing Features

### Try These Actions:
1. ✅ Login with any credentials
2. ✅ Navigate between tabs
3. ✅ View dashboard statistics
4. ✅ Browse orders list
5. ✅ Check products grid
6. ✅ View profile information
7. ✅ Logout and login again

### Mock Data Currently Shows:
- 48 total orders
- 12 pending orders
- 156 products
- $2,450 revenue
- Sample orders with different statuses
- Sample products with various prices

## Troubleshooting

### Issue: "Flutter not found"
**Solution**: Install Flutter SDK and add to PATH
```bash
export PATH="$PATH:`pwd`/flutter/bin"
```

### Issue: "No devices found"
**Solution**: Start an emulator
```bash
# Android
flutter emulators --launch <emulator_id>

# iOS (macOS only)
open -a Simulator
```

### Issue: "Dependencies not found"
**Solution**: Clear and reinstall
```bash
flutter clean
flutter pub get
```

### Issue: "Build failed"
**Solution**: Update Flutter and dependencies
```bash
flutter upgrade
flutter pub upgrade
```

## Development Tips

### Hot Reload
When the app is running, press:
- `r` for hot reload (fast refresh)
- `R` for hot restart (full restart)
- `q` to quit

### Debug Mode
```bash
# Run with debug logging
flutter run --debug -v
```

### View Logs
```bash
# In another terminal
flutter logs
```

### Performance Profile
```bash
# Run in profile mode
flutter run --profile
```

## Building for Production

### Android APK
```bash
# Build debug APK
flutter build apk --debug

# Build release APK
flutter build apk --release

# Output: build/app/outputs/flutter-apk/app-release.apk
```

### Android App Bundle
```bash
# Build for Play Store
flutter build appbundle --release

# Output: build/app/outputs/bundle/release/app-release.aab
```

### iOS (macOS only)
```bash
# Build for iOS
flutter build ios --release
```

## Next Development Steps

### 1. API Integration (Recommended First)
- Create `lib/services/api_service.dart`
- Add API endpoints for MyGetWell backend
- Update auth_service.dart to use real API

### 2. Enhanced Features
- Order detail screen
- Add/Edit product screens
- Product image upload
- Order status updates
- Search and filter

### 3. UI Improvements
- Add app icon
- Custom fonts
- Animations
- Loading skeletons
- Error screens

### 4. Testing
- Add widget tests
- Integration tests
- API mocking for tests

## File Structure Quick Reference

```
lib/
├── main.dart              → Start here
├── models/                → Data structures
├── screens/               → UI pages
├── services/              → Business logic
└── widgets/               → Reusable components (add custom widgets here)
```

## Common Commands

```bash
# Get dependencies
flutter pub get

# Clean build
flutter clean

# Analyze code
flutter analyze

# Format code
flutter format lib/

# Run tests
flutter test

# Check for updates
flutter upgrade

# List devices
flutter devices

# Build APK
flutter build apk
```

## Getting Help

- **Flutter Docs**: https://flutter.dev/docs
- **Provider Package**: https://pub.dev/packages/provider
- **MyGetWell**: https://mygetwell.app
- **Issues**: https://github.com/sbasharjr/Vendor-Mobile-App/issues

## Current App Features

✅ Authentication with session management
✅ Dashboard with statistics
✅ Orders listing
✅ Products grid view
✅ Vendor profile management
✅ Bottom navigation
✅ Form validation
✅ Loading states
✅ Error handling

## What's Mock (Needs Real Implementation)

🔄 Authentication API
🔄 Orders API
🔄 Products API
🔄 Profile API
🔄 Image uploads
🔄 Push notifications

---

**Status**: Ready for development
**Time to first run**: ~5 minutes
**Difficulty**: Easy

Happy coding! 🚀
