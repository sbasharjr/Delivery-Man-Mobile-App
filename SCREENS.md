# MyGetWell Delivery Man App - Screen Documentation

This document provides detailed information about each screen in the application.

## Screen Overview

The application consists of 6 main screens with a clear navigation flow.

---

## 1. Splash Screen
**File**: `lib/screens/splash_screen.dart`

### Purpose
Initial loading screen that checks authentication status and routes users accordingly.

### Features
- Animated MyGetWell logo with gradient background
- Automatic authentication check
- 2-second display time
- Loading indicator
- Auto-navigation to Login or Home

### User Flow
```
App Launch → Splash Screen (2s) → Check Auth
                                      ↓
                          ┌───────────┴───────────┐
                          ↓                       ↓
                    Authenticated            Not Authenticated
                          ↓                       ↓
                    Home Screen              Login Screen
```

### UI Elements
- Large delivery truck icon
- "MyGetWell" title (32px, bold)
- "Delivery Partner" subtitle (18px)
- Circular progress indicator
- Green gradient background (#2E7D32)

---

## 2. Login Screen
**File**: `lib/screens/login_screen.dart`

### Purpose
Secure authentication for delivery personnel.

### Features
- Email/password authentication
- Form validation
- Password visibility toggle
- Loading state during login
- Error message display
- Forgot password link (prepared for future)

### Form Fields
1. **Email Field**
   - Validation: Required, valid email format
   - Keyboard: Email type
   - Icon: Email outline

2. **Password Field**
   - Validation: Required, minimum 6 characters
   - Visibility toggle button
   - Icon: Lock outline

### UI Elements
- Delivery truck icon (80px)
- "Welcome Back" heading
- "Sign in to continue" subheading
- Email input field
- Password input field with toggle
- Login button (full width)
- "Forgot Password?" text button

### States
- **Idle**: Form ready for input
- **Loading**: Circular progress in button
- **Error**: SnackBar with error message
- **Success**: Navigate to Home Screen

---

## 3. Home Screen (Dashboard)
**File**: `lib/screens/home_screen.dart`

### Purpose
Central hub showing order statistics and active deliveries.

### Features
- User profile summary card
- Order statistics (4 cards)
- Active orders preview (up to 3)
- Pull-to-refresh
- Bottom navigation
- Quick actions

### Sections

#### User Profile Card
- Avatar with user initial
- User name
- Active status badge (green)

#### Order Statistics (4 Cards)
1. **Pending Orders**
   - Icon: pending_actions (orange)
   - Count of pending/assigned orders

2. **Active Orders**
   - Icon: local_shipping (blue)
   - Count of picked up/in transit orders

3. **Completed Orders**
   - Icon: check_circle (green)
   - Count of delivered orders

4. **Total Orders**
   - Icon: assignment (purple)
   - Total count of all orders

#### Active Orders Preview
- Shows up to 3 active orders
- OrderSummaryCard widget for each
- "View All" button
- Empty state with inbox icon

### Bottom Navigation
- **Home** (active)
- **Orders**
- **Profile**

### UI Elements
- AppBar with "Dashboard" title and refresh button
- Profile card with avatar and status
- Grid of 4 statistic cards (2x2)
- "Active Orders" section header
- List of order cards
- Bottom navigation bar

---

## 4. Orders Screen
**File**: `lib/screens/orders_screen.dart`

### Purpose
View and manage all orders with filtering by status.

### Features
- Tabbed interface (3 tabs)
- Filtered order lists
- Pull-to-refresh
- Tap to view details
- Empty states

### Tabs
1. **Pending** - New and assigned orders
2. **Active** - Picked up and in transit orders
3. **Completed** - Delivered orders

### UI Elements
- AppBar with "My Orders" title and refresh
- TabBar with 3 tabs
- TabBarView with 3 lists
- OrderSummaryCard for each order
- Empty state: inbox icon + "No orders found"

### Order Card Components
- Order ID (e.g., "Order #123")
- Status badge (color-coded)
- Customer name with person icon
- Delivery address with location icon (2 lines max)
- Order date with calendar icon
- Total amount (green, bold)

---

## 5. Order Detail Screen
**File**: `lib/screens/order_detail_screen.dart`

### Purpose
Display complete order information and manage delivery status.

### Features
- Full order details
- Customer contact (phone call)
- Map navigation
- Status update workflow
- Special instructions display

### Sections

#### Status Banner
- Full-width colored header
- Status text (e.g., "In Transit")
- Order date
- Color-coded by status:
  - Pending: Orange
  - Assigned: Blue
  - Picked Up: Purple
  - In Transit: Indigo
  - Delivered: Green

#### Customer Information Card
- Customer name with person icon
- Phone number with phone icon
- Call button (green, opens phone dialer)

#### Delivery Address Card
- Full address with location icon
- "Open in Maps" button (if GPS available)
- Launches Google Maps with coordinates

#### Order Items Card
- List of all items
- Item name x quantity
- Item price
- Formatted as: "Product Name x2 - $25.00"

#### Order Summary Card
- "Total Amount" label
- Total price (large, bold, green)

#### Special Instructions Card (if present)
- Yellow background
- Info icon
- Special delivery notes

### Action Buttons (Bottom Bar)
Visible only for non-final statuses:

1. **Assigned → Picked Up**: "Mark as Picked Up"
2. **Picked Up → In Transit**: "Start Delivery"
3. **In Transit → Delivered**: "Mark as Delivered"

Hidden for:
- Delivered orders
- Cancelled orders
- Pending orders (waiting for assignment)

### UI Elements
- AppBar with order number
- Status banner (colored header)
- Scrollable content area
- Multiple information cards
- Bottom action button (conditional)

---

## 6. Profile Screen
**File**: `lib/screens/profile_screen.dart`

### Purpose
Display user information and app settings.

### Features
- User profile display
- Personal information cards
- Settings menu
- About dialog
- Logout with confirmation

### Sections

#### Profile Header
- Colored background (primary color)
- Large avatar with user initial
- User name (24px, bold)
- "Delivery Man" badge

#### Information Cards
1. **Email**
   - Email icon
   - "Email" label
   - Email address

2. **Phone**
   - Phone icon
   - "Phone" label
   - Phone number

3. **Vehicle Type** (if available)
   - Car icon
   - "Vehicle Type" label
   - Vehicle type (e.g., "Motorcycle")

4. **Vehicle Number** (if available)
   - Pin icon
   - "Vehicle Number" label
   - License plate number

#### Menu Items
1. **Edit Profile**
   - Edit icon
   - Coming soon placeholder

2. **Delivery History**
   - History icon
   - Coming soon placeholder

3. **Notifications**
   - Notifications icon
   - Coming soon placeholder

4. **Help & Support**
   - Help icon
   - Coming soon placeholder

5. **About**
   - Info icon
   - Shows about dialog with app info

#### Logout Button
- Full-width red button
- Confirmation dialog
- Clears session and returns to login

### UI Elements
- Colored header section
- Large circular avatar
- Info cards with labels and values
- Menu list tiles with icons
- Red logout button
- Alert dialogs for confirmation

---

## Navigation Flow

```
Login Screen
    ↓ (on success)
Home Screen ←→ Orders Screen ←→ Profile Screen
    ↓              ↓
    │         Order Detail
    │              ↓
    │      Update Status
    │              ↓
    └──────← Home Screen
                   ↓
              Profile Screen
                   ↓
                Logout
                   ↓
              Login Screen
```

---

## Color Coding by Status

| Status | Color | Hex | Usage |
|--------|-------|-----|-------|
| Pending | Orange | #FF9800 | New orders |
| Assigned | Blue | #2196F3 | Assigned to driver |
| Picked Up | Purple | #9C27B0 | Item collected |
| In Transit | Indigo | #3F51B5 | Delivery in progress |
| Delivered | Green | #4CAF50 | Completed |
| Cancelled | Red | #F44336 | Cancelled orders |

---

## Common UI Components

### OrderSummaryCard Widget
**File**: `lib/widgets/order_summary_card.dart`

Reusable card component showing order summary:
- Order ID
- Status badge
- Customer name
- Delivery address (truncated)
- Order date
- Total amount
- Tap to view details

### Bottom Navigation Bar
Used on: Home, Orders, Profile screens

3 items:
1. Home icon - Navigate to dashboard
2. List icon - Navigate to orders
3. Person icon - Navigate to profile

### AppBar Pattern
Consistent across all screens:
- Title centered
- Back button (when needed)
- Action buttons (refresh, etc.)
- Primary color background
- White text

---

## Responsive Design

All screens are designed to:
- Work on various screen sizes
- Support portrait and landscape (where appropriate)
- Use flexible layouts (Column, Row, Expanded)
- Scroll when content exceeds screen height
- Handle keyboard appearance (login screen)

---

## Empty States

Consistent empty state design:
- Large inbox icon (64px, grey)
- "No orders found" / similar message
- Grey text color
- Centered layout
- Padding for visual comfort

---

## Loading States

Consistent loading patterns:
- CircularProgressIndicator (primary color)
- Centered in available space
- Button loading: small circular indicator in button
- Full-screen loading: centered with padding

---

## Error Handling

Consistent error display:
- SnackBar at bottom of screen
- Red background for errors
- Green background for success
- 3-second duration
- Dismissible by user

---

This completes the screen documentation for the MyGetWell Delivery Man App.
