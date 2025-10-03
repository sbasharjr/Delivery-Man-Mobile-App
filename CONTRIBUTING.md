# Contributing to MyGetWell Vendor Mobile App

Thank you for your interest in contributing to the MyGetWell Vendor Mobile App! This document provides guidelines and instructions for contributing.

## Table of Contents

1. [Code of Conduct](#code-of-conduct)
2. [Getting Started](#getting-started)
3. [Development Workflow](#development-workflow)
4. [Coding Standards](#coding-standards)
5. [Testing Guidelines](#testing-guidelines)
6. [Pull Request Process](#pull-request-process)
7. [Reporting Issues](#reporting-issues)

## Code of Conduct

- Be respectful and constructive
- Focus on the code, not the person
- Accept feedback graciously
- Help others learn and grow

## Getting Started

### Prerequisites

1. Install Flutter SDK (3.0+)
2. Install Dart SDK (3.0+)
3. Install Git
4. Install an IDE (VS Code or Android Studio recommended)

### Setup Development Environment

```bash
# Clone the repository
git clone https://github.com/sbasharjr/Vendor-Mobile-App.git
cd Vendor-Mobile-App

# Install dependencies
flutter pub get

# Verify setup
flutter doctor
flutter analyze
```

### Running the App

```bash
# Development mode with hot reload
flutter run --debug

# Profile mode for performance testing
flutter run --profile
```

## Development Workflow

### 1. Create a Branch

```bash
# Create a feature branch
git checkout -b feature/your-feature-name

# Create a bugfix branch
git checkout -b fix/bug-description
```

### 2. Make Changes

- Write clean, maintainable code
- Follow the existing code structure
- Add comments for complex logic
- Update documentation if needed

### 3. Test Your Changes

```bash
# Run tests
flutter test

# Analyze code
flutter analyze

# Format code
flutter format lib/
```

### 4. Commit Your Changes

```bash
# Stage changes
git add .

# Commit with a clear message
git commit -m "feat: add order detail screen"

# Or for bug fixes
git commit -m "fix: resolve login validation issue"
```

#### Commit Message Format

Use conventional commits:

- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation changes
- `style:` Code style changes (formatting, etc.)
- `refactor:` Code refactoring
- `test:` Adding or updating tests
- `chore:` Maintenance tasks

### 5. Push and Create PR

```bash
# Push to your branch
git push origin feature/your-feature-name

# Create a Pull Request on GitHub
```

## Coding Standards

### Dart/Flutter Guidelines

1. **Follow Flutter Style Guide**
   - Use `flutter format` before committing
   - Follow naming conventions
   - Use meaningful variable names

2. **Code Organization**
   ```dart
   // Good
   class OrderService {
     Future<List<Order>> fetchOrders() async {
       // Implementation
     }
   }

   // Bad
   class os {
     Future<dynamic> get() async {
       // Implementation
     }
   }
   ```

3. **Widget Structure**
   ```dart
   class MyWidget extends StatelessWidget {
     const MyWidget({super.key});

     @override
     Widget build(BuildContext context) {
       return Container(
         // Widget tree
       );
     }
   }
   ```

4. **Use Const Constructors**
   ```dart
   // Good
   const Text('Hello');
   
   // Less optimal
   Text('Hello');
   ```

5. **Null Safety**
   - Use null-safe Dart code
   - Properly handle nullable types
   - Use `!` operator sparingly

### Project Structure

```
lib/
├── main.dart              # Entry point
├── models/                # Data models
├── screens/               # UI screens
├── services/              # Business logic
├── widgets/               # Reusable widgets
├── utils/                 # Utility functions
└── constants/             # App constants
```

### File Naming

- Use `snake_case` for file names: `order_service.dart`
- Use `PascalCase` for class names: `OrderService`
- Use `camelCase` for variables: `orderList`

## Testing Guidelines

### 1. Unit Tests

Create tests for:
- Data models
- Services
- Utility functions

```dart
test('Order should calculate total correctly', () {
  final order = Order(/* ... */);
  expect(order.total, equals(100.0));
});
```

### 2. Widget Tests

Test UI components:
```dart
testWidgets('Login button should be displayed', (tester) async {
  await tester.pumpWidget(const LoginScreen());
  expect(find.text('Login'), findsOneWidget);
});
```

### 3. Integration Tests

Test complete user flows:
```dart
testWidgets('User can login and view dashboard', (tester) async {
  // Test implementation
});
```

### Run Tests

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/models_test.dart

# Run with coverage
flutter test --coverage
```

## Pull Request Process

### Before Submitting

- ✅ Code is formatted (`flutter format lib/`)
- ✅ No analyzer warnings (`flutter analyze`)
- ✅ All tests pass (`flutter test`)
- ✅ Documentation is updated
- ✅ CHANGELOG.md is updated

### PR Title Format

```
feat: Add order detail screen
fix: Resolve login validation issue
docs: Update README with API integration guide
```

### PR Description Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Unit tests added/updated
- [ ] Widget tests added/updated
- [ ] Manual testing completed

## Screenshots (if applicable)
Add screenshots here

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Comments added for complex code
- [ ] Documentation updated
- [ ] No new warnings
- [ ] Tests pass
```

## Reporting Issues

### Bug Reports

Use this template:

```markdown
**Bug Description**
A clear description of the bug

**To Reproduce**
Steps to reproduce:
1. Go to '...'
2. Click on '...'
3. See error

**Expected Behavior**
What should happen

**Screenshots**
If applicable

**Environment**
- Device: [e.g., iPhone 12, Pixel 5]
- OS: [e.g., iOS 15, Android 12]
- App Version: [e.g., 1.0.0]
```

### Feature Requests

```markdown
**Feature Description**
Clear description of the feature

**Use Case**
Why is this feature needed?

**Proposed Solution**
How should it work?

**Alternatives Considered**
Other approaches you've thought about
```

## Areas for Contribution

### High Priority

1. **Backend Integration**
   - Implement real API calls
   - Add authentication service
   - Handle API errors

2. **Feature Development**
   - Order detail screen
   - Product management
   - Image upload

3. **Testing**
   - Add widget tests
   - Add integration tests
   - Increase coverage

### Good First Issues

- Add loading animations
- Improve error messages
- Add empty state screens
- Update documentation
- Fix UI inconsistencies

### Documentation

- API integration guide
- Component documentation
- Video tutorials
- Code examples

## Development Best Practices

### 1. State Management

Use Provider for state management:
```dart
// Define a service
class OrderService extends ChangeNotifier {
  List<Order> _orders = [];
  
  void addOrder(Order order) {
    _orders.add(order);
    notifyListeners();
  }
}

// Use in widget
Consumer<OrderService>(
  builder: (context, orderService, child) {
    return ListView.builder(
      itemCount: orderService.orders.length,
      itemBuilder: (context, index) {
        return OrderCard(order: orderService.orders[index]);
      },
    );
  },
)
```

### 2. Error Handling

```dart
try {
  final result = await apiService.fetchData();
  // Handle success
} catch (e) {
  // Handle error
  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $e')),
    );
  }
}
```

### 3. Responsive Design

```dart
// Use MediaQuery for responsive layouts
final screenWidth = MediaQuery.of(context).size.width;
final isTablet = screenWidth > 600;
```

## Getting Help

- **Questions**: Open a GitHub Discussion
- **Bugs**: Create an Issue
- **Chat**: Join our community (if available)
- **Email**: Contact maintainers

## Recognition

Contributors will be:
- Listed in CONTRIBUTORS.md
- Mentioned in release notes
- Appreciated in the community

Thank you for contributing! 🎉
