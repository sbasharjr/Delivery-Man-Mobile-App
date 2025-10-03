# MyGetWell Delivery Man App - Architecture Overview

## Application Architecture

This Flutter application follows a clean architecture pattern with clear separation of concerns:

```
┌─────────────────────────────────────────────────────────────┐
│                        Presentation Layer                    │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐   │
│  │  Splash  │  │  Login   │  │   Home   │  │  Orders  │   │
│  │  Screen  │  │  Screen  │  │  Screen  │  │  Screen  │   │
│  └──────────┘  └──────────┘  └──────────┘  └──────────┘   │
│  ┌──────────┐  ┌──────────┐                                 │
│  │  Order   │  │ Profile  │                                 │
│  │  Detail  │  │  Screen  │                                 │
│  └──────────┘  └──────────┘                                 │
└─────────────────────────────────────────────────────────────┘
                           ↕
┌─────────────────────────────────────────────────────────────┐
│                    State Management (Provider)               │
│  ┌─────────────────┐         ┌─────────────────┐           │
│  │  Auth Provider  │         │  Order Provider │           │
│  │  - Login        │         │  - Fetch Orders │           │
│  │  - Logout       │         │  - Update Status│           │
│  │  - User State   │         │  - Order State  │           │
│  └─────────────────┘         └─────────────────┘           │
└─────────────────────────────────────────────────────────────┘
                           ↕
┌─────────────────────────────────────────────────────────────┐
│                         Service Layer                        │
│  ┌──────────────┐           ┌──────────────────┐           │
│  │ API Service  │           │  Storage Service │           │
│  │ - REST calls │           │  - SharedPrefs   │           │
│  │ - HTTP       │           │  - User cache    │           │
│  └──────────────┘           └──────────────────┘           │
└─────────────────────────────────────────────────────────────┘
                           ↕
┌─────────────────────────────────────────────────────────────┐
│                          Data Layer                          │
│  ┌──────────────┐           ┌──────────────────┐           │
│  │ Order Model  │           │    User Model    │           │
│  │ - Order      │           │    - User        │           │
│  │ - OrderItem  │           │                  │           │
│  └──────────────┘           └──────────────────┘           │
└─────────────────────────────────────────────────────────────┘
```

## Screen Flow

```
Splash Screen (Auto-navigate)
    ↓
    ├─ If authenticated → Home Screen
    └─ If not authenticated → Login Screen
                                ↓
                            Login Success
                                ↓
                            Home Screen
                                ↓
                    ┌───────────┼───────────┐
                    ↓           ↓           ↓
            Orders Screen   Home Screen   Profile Screen
                ↓
        Order Detail Screen
            ↓
    [Update Status: Picked Up → In Transit → Delivered]
```

## Key Features by Screen

### 1. Splash Screen (`splash_screen.dart`)
- Animated logo display
- Auto-authentication check
- Route to appropriate screen

### 2. Login Screen (`login_screen.dart`)
- Email/password authentication
- Form validation
- Error handling
- Loading states

### 3. Home Screen (`home_screen.dart`)
- Order statistics dashboard
- Active order summary cards
- Quick navigation
- Pull-to-refresh
- Bottom navigation bar

### 4. Orders Screen (`orders_screen.dart`)
- Tabbed interface (Pending, Active, Completed)
- Filtered order lists
- Pull-to-refresh
- Tap to view details

### 5. Order Detail Screen (`order_detail_screen.dart`)
- Complete order information
- Customer contact (phone call)
- Maps integration
- Status update buttons
- Special instructions display

### 6. Profile Screen (`profile_screen.dart`)
- User information display
- Profile settings
- App information
- Logout functionality

## State Management

### Auth Provider (`auth_provider.dart`)
```dart
- User? currentUser
- bool isLoading
- bool isAuthenticated
- login(email, password)
- register(userData)
- logout()
- loadUserFromStorage()
```

### Order Provider (`order_provider.dart`)
```dart
- List<Order> orders
- Order? selectedOrder
- List<Order> pendingOrders
- List<Order> activeOrders
- List<Order> completedOrders
- fetchOrders()
- updateOrderStatus(orderId, status)
```

## API Endpoints

Base URL: `https://mygetwell.app/api`

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/delivery/login` | Authenticate delivery personnel |
| POST | `/delivery/register` | Register new delivery personnel |
| GET | `/delivery/orders` | Get assigned orders |
| GET | `/delivery/orders/:id` | Get order details |
| PUT | `/delivery/orders/:id/status` | Update order status |
| PUT | `/delivery/profile` | Update profile |

## Order Status Flow

```
pending → assigned → picked_up → in_transit → delivered
```

Each status has:
- Unique color coding
- Appropriate action buttons
- Status badge display

## Dependencies

### Core Flutter Packages
- `provider` - State management
- `http` - API communication
- `shared_preferences` - Local storage

### UI/UX Packages
- `cached_network_image` - Image caching
- `intl` - Date/time formatting
- `flutter_svg` - SVG support

### Functionality Packages
- `google_maps_flutter` - Maps integration
- `geolocator` - Location services
- `url_launcher` - Phone calls and maps
- `image_picker` - Camera access (for future POD)

## Design System

### Colors
- Primary: `#2E7D32` (Healthcare Green)
- Secondary: `#43A047`
- Accent: `#FF6F00`
- Success: `#388E3C`
- Error: `#D32F2F`

### Typography
- Font Family: Roboto
- Weights: Regular (400), Bold (700)

### Component Styling
- Border Radius: 8-12px
- Card Elevation: 2
- Button Padding: 16px vertical, 32px horizontal

## File Organization

```
lib/
├── main.dart                     # App entry point, routing
├── models/                       # Data models
│   ├── order.dart               # Order & OrderItem classes
│   └── user.dart                # User class
├── providers/                    # State management
│   ├── auth_provider.dart       # Authentication state
│   └── order_provider.dart      # Order management state
├── screens/                      # UI screens
│   ├── splash_screen.dart       # Initial loading screen
│   ├── login_screen.dart        # Authentication screen
│   ├── home_screen.dart         # Dashboard
│   ├── orders_screen.dart       # Order list with tabs
│   ├── order_detail_screen.dart # Detailed order view
│   └── profile_screen.dart      # User profile
├── services/                     # Business logic
│   ├── api_service.dart         # HTTP API calls
│   └── storage_service.dart     # Local data persistence
├── utils/                        # Utilities
│   └── app_theme.dart           # Theme configuration
└── widgets/                      # Reusable components
    └── order_summary_card.dart  # Order card widget
```

## Testing Strategy

### Unit Tests
- Model serialization/deserialization
- Provider state changes
- API service methods
- Storage service methods

### Widget Tests
- Screen rendering
- User interactions
- Navigation flows
- Form validation

### Integration Tests
- Complete user journeys
- Authentication flow
- Order management flow
- Status update workflow

## Building & Deployment

### Development Build
```bash
flutter run
```

### Android Production Build
```bash
flutter build apk --release
# Or
flutter build appbundle --release
```

### iOS Production Build
```bash
flutter build ios --release
```

## Future Enhancements

1. **Real-time Updates**: WebSocket integration for live order updates
2. **Push Notifications**: Firebase Cloud Messaging for order notifications
3. **Offline Support**: Local database with sync capability
4. **Proof of Delivery**: Photo capture and signature
5. **Earning Reports**: Daily/weekly/monthly earnings dashboard
6. **Route Optimization**: Multi-order route planning
7. **In-app Chat**: Communication with customers and support
8. **Multi-language**: Internationalization support

## Security Considerations

- Token-based authentication
- Secure storage of credentials
- HTTPS-only API communication
- Input validation and sanitization
- Session timeout handling

## Performance Optimizations

- Image caching for user profiles
- Lazy loading of order lists
- Pagination for large datasets
- Debouncing for API calls
- Efficient state updates with Provider
