# MyGetWell Delivery Man App

A Flutter mobile application for delivery personnel working with https://mygetwell.app platform.

## Description

This is a standalone delivery man mobile app that allows delivery partners to:
- View and manage assigned delivery orders
- Track order status (pending, assigned, picked up, in transit, delivered)
- Navigate to delivery locations using integrated maps
- Contact customers directly from the app
- Update delivery status in real-time
- Manage their delivery profile and settings

## Features

### Authentication
- Secure login for delivery personnel
- Profile management

### Order Management
- Real-time order list with filtering (Pending, Active, Completed)
- Detailed order information including customer details and delivery address
- Order status tracking and updates
- Multiple order views (dashboard statistics and list view)

### Delivery Operations
- One-tap phone call to customers
- Integrated Google Maps navigation
- Status update workflows (Picked Up → In Transit → Delivered)
- Special delivery instructions display

### User Interface
- Clean, professional design with healthcare-themed colors
- Bottom navigation for easy access to Home, Orders, and Profile
- Pull-to-refresh functionality
- Responsive cards and layouts

## Technology Stack

- **Framework**: Flutter 3.0+
- **State Management**: Provider
- **Networking**: HTTP package
- **Local Storage**: SharedPreferences
- **Maps Integration**: Google Maps Flutter
- **Location Services**: Geolocator

## Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / Xcode for mobile development
- An IDE (VS Code, Android Studio, or IntelliJ)

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

### Configuration

Update the API base URL in `lib/services/api_service.dart`:
```dart
static const String baseUrl = 'https://mygetwell.app/api';
```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
│   ├── order.dart
│   └── user.dart
├── providers/                # State management
│   ├── auth_provider.dart
│   └── order_provider.dart
├── screens/                  # UI screens
│   ├── splash_screen.dart
│   ├── login_screen.dart
│   ├── home_screen.dart
│   ├── orders_screen.dart
│   ├── order_detail_screen.dart
│   └── profile_screen.dart
├── services/                 # API and storage services
│   ├── api_service.dart
│   └── storage_service.dart
├── utils/                    # Utilities and constants
│   └── app_theme.dart
└── widgets/                  # Reusable widgets
    └── order_summary_card.dart
```

## API Integration

The app expects the following API endpoints:

- `POST /api/delivery/login` - Delivery personnel login
- `POST /api/delivery/register` - New delivery personnel registration
- `GET /api/delivery/orders` - Fetch assigned orders
- `GET /api/delivery/orders/:id` - Fetch order details
- `PUT /api/delivery/orders/:id/status` - Update order status
- `PUT /api/delivery/profile` - Update delivery personnel profile

## Building for Production

### Android
```bash
flutter build apk --release
# or
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

## Order Status Flow

```
Pending/Assigned → Picked Up → In Transit → Delivered
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is proprietary software for MyGetWell platform.

## Support

For support, please contact the development team or open an issue in the repository.

## Screenshots

(Add screenshots here once the app is running)

## Version History

- **1.0.0** (Initial Release)
  - Authentication system
  - Order listing and management
  - Delivery status updates
  - Profile management
  - Maps and phone integration