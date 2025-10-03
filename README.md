# MyGetWell Vendor Mobile App

A Flutter-based mobile application for vendors to manage their business on the MyGetWell platform (https://mygetwell.app).

## Features

- **Authentication**: Secure vendor login and session management
- **Dashboard**: Real-time overview of orders, products, and revenue
- **Order Management**: View and manage customer orders
- **Product Management**: Add, edit, and manage product inventory
- **Profile Management**: Update vendor profile and business information

## Screenshots

The app includes:
- Splash Screen with MyGetWell branding
- Login Screen with form validation
- Dashboard with statistics cards and recent orders
- Orders listing with status indicators
- Products grid with inventory management
- Profile screen with vendor information

## Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / Xcode for mobile development
- An Android or iOS device/emulator

### Installation

1. Clone the repository:
```bash
git clone https://github.com/sbasharjr/Vendor-Mobile-App.git
cd Vendor-Mobile-App
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

### Building for Production

#### Android
```bash
flutter build apk --release
# or for app bundle
flutter build appbundle --release
```

#### iOS
```bash
flutter build ios --release
```

## Project Structure

```
lib/
├── main.dart              # App entry point
├── models/                # Data models
│   ├── vendor.dart
│   ├── product.dart
│   └── order.dart
├── screens/               # UI screens
│   ├── splash_screen.dart
│   ├── login_screen.dart
│   ├── home_screen.dart
│   ├── orders_screen.dart
│   ├── products_screen.dart
│   └── profile_screen.dart
├── services/              # Business logic
│   └── auth_service.dart
└── widgets/               # Reusable widgets
```

## Dependencies

- **flutter**: SDK for building the app
- **provider**: State management
- **http**: API communication
- **shared_preferences**: Local data persistence
- **intl**: Internationalization and formatting

## Configuration

### API Integration

To connect to the MyGetWell backend API, update the API endpoints in the service files:

```dart
// lib/services/api_service.dart
const String baseUrl = 'https://api.mygetwell.app';
```

### Authentication

The app currently uses mock authentication. To implement real authentication:

1. Update `lib/services/auth_service.dart`
2. Add API calls to your backend
3. Handle tokens and session management

## Testing

Run tests with:
```bash
flutter test
```

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is part of the MyGetWell ecosystem.

## Support

For support and questions, please visit [https://mygetwell.app](https://mygetwell.app)
