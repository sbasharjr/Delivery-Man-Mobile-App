# MyGetWell Vendor App

A Flutter mobile application for vendors/stores working with https://mygetwell.app platform.

## Description

This is a standalone vendor mobile app that allows store owners/vendors to:
- Manage their store profile and information
- View and manage incoming orders from customers
- Add, update, and delete products in their inventory
- Accept or decline orders
- Track order status (pending, accepted, preparing, ready, completed)
- Contact customers directly from the app
- Update order status in real-time
- Monitor sales and product statistics

## Features

### Authentication
- Secure login for vendors
- Store profile management

### Order Management
- Real-time order list with filtering (Pending, Active, Ready, Completed)
- Detailed order information including customer details and delivery address
- Order status tracking and updates
- Accept/decline orders workflow
- Status update workflows (Accept → Preparing → Ready → Completed)
- Special order instructions display
- Payment method and delivery type information

### Product Management
- Add new products to inventory
- Update existing product details (name, price, stock, category)
- Delete products from inventory
- Track product availability and stock levels
- Product categorization
- Support for different units (pcs, kg, ltr, etc.)
- Image support for products

### Store Management
- Store profile with name, address, and description
- Contact information management
- Active/inactive status toggle

### User Interface
- Clean, professional design with business-themed colors
- Bottom navigation for easy access to Home, Orders, Products, and Profile
- Pull-to-refresh functionality
- Responsive cards and layouts
- Intuitive product and order management

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
git clone https://github.com/sbasharjr/Delivery-Man-Mobile-App.git
cd Delivery-Man-Mobile-App
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
│   ├── product.dart
│   └── user.dart
├── providers/                # State management
│   ├── auth_provider.dart
│   ├── order_provider.dart
│   └── product_provider.dart
├── screens/                  # UI screens
│   ├── splash_screen.dart
│   ├── login_screen.dart
│   ├── home_screen.dart
│   ├── orders_screen.dart
│   ├── order_detail_screen.dart
│   ├── products_screen.dart
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

### Authentication
- `POST /api/vendor/login` - Vendor login
- `POST /api/vendor/register` - New vendor registration

### Order Management
- `GET /api/vendor/orders` - Fetch store orders
- `GET /api/vendor/orders/:id` - Fetch order details
- `PUT /api/vendor/orders/:id/status` - Update order status

### Product Management
- `GET /api/vendor/products` - Fetch store products
- `POST /api/vendor/products` - Add new product
- `PUT /api/vendor/products/:id` - Update product
- `DELETE /api/vendor/products/:id` - Delete product

### Profile Management
- `PUT /api/vendor/profile` - Update store profile

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

For Vendors:
```
Pending → Accepted → Preparing → Ready → Completed
        ↘ Cancelled
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