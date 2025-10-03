# MyGetWell Vendor App - Architecture Overview

## Application Architecture

This Flutter application follows a clean architecture pattern with clear separation of concerns:

```
┌─────────────────────────────────────────────────────────────┐
│                        Presentation Layer                    │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐   │
│  │  Splash  │  │  Login   │  │   Home   │  │  Orders  │   │
│  │  Screen  │  │  Screen  │  │  Screen  │  │  Screen  │   │
│  └──────────┘  └──────────┘  └──────────┘  └──────────┘   │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐                 │
│  │  Order   │  │ Profile  │  │ Products │                 │
│  │  Detail  │  │  Screen  │  │  Screen  │                 │
│  └──────────┘  └──────────┘  └──────────┘                 │
└─────────────────────────────────────────────────────────────┘
                           ↕
┌─────────────────────────────────────────────────────────────┐
│                    State Management (Provider)               │
│  ┌─────────────────┐  ┌─────────────────┐ ┌─────────────┐ │
│  │  Auth Provider  │  │  Order Provider │ │Product Prov │ │
│  │  - Login        │  │  - Fetch Orders │ │- Fetch Prods│ │
│  │  - Logout       │  │  - Update Status│ │- Add Product│ │
│  │  - User State   │  │  - Order State  │ │- Update/Del │ │
│  └─────────────────┘  └─────────────────┘ └─────────────┘ │
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
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────────┐ │
│  │ Order Model  │  │  User Model  │  │  Product Model   │ │
│  │ - Order      │  │  - User      │  │  - Product       │ │
│  │ - OrderItem  │  │              │  │                  │ │
│  └──────────────┘  └──────────────┘  └──────────────────┘ │
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
                ┌───────────────┼───────────────┬───────────┐
                ↓               ↓               ↓           ↓
        Orders Screen   Products Screen   Home Screen   Profile Screen
            ↓               ↓
    Order Detail Screen  [Add/Edit Product Dialog]
        ↓
    [Update Status: Accept → Preparing → Ready → Completed]
```

## Key Features by Screen

### 1. Splash Screen (`splash_screen.dart`)
- Animated vendor logo display
- Auto-authentication check
- Route to appropriate screen

### 2. Login Screen (`login_screen.dart`)
- Email/password authentication
- Form validation
- Error handling
- Loading states

### 3. Home Screen (`home_screen.dart`)
- Vendor dashboard with statistics
- Order statistics (Pending, Active, Ready)
- Product count
- Pending orders preview
- Quick navigation
- Pull-to-refresh
- Bottom navigation bar (4 tabs)

### 4. Orders Screen (`orders_screen.dart`)
- Tabbed interface (Pending, Active, Ready, Completed)
- Filtered order lists
- Pull-to-refresh
- Tap to view details

### 5. Order Detail Screen (`order_detail_screen.dart`)
- Complete order information
- Customer contact (phone call)
- Maps integration (if needed)
- Accept/Decline workflow for pending orders
- Status update buttons (Preparing, Ready, Completed)
- Special instructions display

### 6. Products Screen (`products_screen.dart`)
- Tabbed interface (Available, Out of Stock)
- Product list with images
- Add new product (FAB)
- Edit/delete product options
- Product details (name, price, stock, category)
- Pull-to-refresh

### 7. Profile Screen (`profile_screen.dart`)
- Store/vendor information display
- Store name, address, description
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
- List<Order> readyOrders
- List<Order> completedOrders
- fetchOrders()
- updateOrderStatus(orderId, status)
```

### Product Provider (`product_provider.dart`)
```dart
- List<Product> products
- Product? selectedProduct
- List<Product> availableProducts
- List<Product> outOfStockProducts
- fetchProducts()
- addProduct(productData)
- updateProduct(productId, updates)
- deleteProduct(productId)
```

## API Endpoints

Base URL: `https://mygetwell.app/api`

### Authentication
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/vendor/login` | Authenticate vendor |
| POST | `/vendor/register` | Register new vendor |

### Order Management
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/vendor/orders` | Get store orders |
| GET | `/vendor/orders/:id` | Get order details |
| PUT | `/vendor/orders/:id/status` | Update order status |

### Product Management
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/vendor/products` | Get store products |
| POST | `/vendor/products` | Add new product |
| PUT | `/vendor/products/:id` | Update product |
| DELETE | `/vendor/products/:id` | Delete product |

### Profile Management
| Method | Endpoint | Description |
|--------|----------|-------------|
| PUT | `/vendor/profile` | Update store profile |

## Order Status Flow

```
pending → accepted → preparing → ready → completed
        ↘ cancelled
```

Each status has:
- Unique color coding
- Appropriate action buttons
- Status badge display

Vendor-specific statuses:
- **pending**: New order awaiting vendor response
- **accepted**: Vendor has accepted the order
- **preparing**: Vendor is preparing the order
- **ready**: Order is ready for pickup/delivery
- **completed**: Order has been fulfilled
- **cancelled**: Order was declined or cancelled

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
- `image_picker` - Camera access (for product images)

## Design System

### Colors
- Primary: `#1976D2` (Business Blue)
- Secondary: `#42A5F5`
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
│   ├── user.dart                # User class
│   └── product.dart             # Product class
├── providers/                    # State management
│   ├── auth_provider.dart       # Authentication state
│   ├── order_provider.dart      # Order management state
│   └── product_provider.dart    # Product management state
├── screens/                      # UI screens
│   ├── splash_screen.dart       # Initial loading screen
│   ├── login_screen.dart        # Authentication screen
│   ├── home_screen.dart         # Vendor dashboard
│   ├── orders_screen.dart       # Order list with tabs
│   ├── order_detail_screen.dart # Detailed order view
│   ├── products_screen.dart     # Product management
│   └── profile_screen.dart      # Store profile
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
