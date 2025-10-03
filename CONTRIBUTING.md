# Contributing to MyGetWell Delivery Man App

Thank you for your interest in contributing to the MyGetWell Delivery Man App! This document provides guidelines and instructions for contributing.

## Getting Started

### Prerequisites

1. **Flutter SDK**: Install Flutter 3.0.0 or higher
   ```bash
   flutter --version
   ```

2. **Development Environment**:
   - VS Code with Flutter/Dart extensions, or
   - Android Studio with Flutter plugin

3. **Platform Tools**:
   - Android SDK for Android development
   - Xcode for iOS development (macOS only)

### Setup

1. Fork and clone the repository:
   ```bash
   git clone https://github.com/YOUR_USERNAME/Vendor-Mobile-App.git
   cd Vendor-Mobile-App
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Verify installation:
   ```bash
   flutter doctor
   ```

## Development Workflow

### Branch Naming Convention

Use descriptive branch names with the following prefixes:
- `feature/` - New features (e.g., `feature/add-notifications`)
- `fix/` - Bug fixes (e.g., `fix/login-validation`)
- `refactor/` - Code refactoring (e.g., `refactor/api-service`)
- `docs/` - Documentation updates (e.g., `docs/update-readme`)
- `test/` - Adding tests (e.g., `test/order-provider`)

### Making Changes

1. Create a new branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. Make your changes following the coding standards below

3. Test your changes:
   ```bash
   flutter test
   flutter analyze
   ```

4. Commit with descriptive messages:
   ```bash
   git commit -m "feat: add push notification support"
   ```

### Commit Message Format

Follow the Conventional Commits specification:

```
<type>(<scope>): <subject>

<body>

<footer>
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

Examples:
```
feat(orders): add filtering by date range
fix(auth): resolve token expiration issue
docs(readme): update installation instructions
```

## Code Style Guidelines

### Dart Style

1. **Use `dart format`** to format your code:
   ```bash
   dart format lib/
   ```

2. **Follow Flutter style guide**:
   - Use `const` constructors where possible
   - Prefer `final` over `var` for variables that don't change
   - Use meaningful variable and function names
   - Add comments for complex logic

3. **Widget Organization**:
   ```dart
   class MyWidget extends StatelessWidget {
     // 1. Constructor and Key
     const MyWidget({Key? key}) : super(key: key);
     
     // 2. Build method
     @override
     Widget build(BuildContext context) {
       return Container();
     }
     
     // 3. Private helper methods
     Widget _buildHeader() {
       return Text('Header');
     }
   }
   ```

### File Organization

1. **Import Order**:
   ```dart
   // 1. Dart imports
   import 'dart:async';
   
   // 2. Flutter imports
   import 'package:flutter/material.dart';
   
   // 3. Package imports
   import 'package:provider/provider.dart';
   
   // 4. Local imports
   import '../models/order.dart';
   import '../services/api_service.dart';
   ```

2. **File Naming**: Use `snake_case` for file names
   - ✅ `order_detail_screen.dart`
   - ❌ `OrderDetailScreen.dart`

### State Management

1. Use Provider for state management
2. Keep providers focused and single-responsibility
3. Use `ChangeNotifierProvider` for mutable state
4. Call `notifyListeners()` after state changes

Example:
```dart
class MyProvider with ChangeNotifier {
  bool _isLoading = false;
  
  bool get isLoading => _isLoading;
  
  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      // Fetch data
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
```

## Testing Guidelines

### Unit Tests

Create unit tests for:
- Models (serialization/deserialization)
- Providers (state changes)
- Services (API calls, storage)
- Utilities (helper functions)

Example:
```dart
// test/models/order_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:delivery_man_app/models/order.dart';

void main() {
  group('Order Model', () {
    test('fromJson creates valid Order', () {
      final json = {
        'id': '123',
        'customer_name': 'John Doe',
        // ... more fields
      };
      
      final order = Order.fromJson(json);
      
      expect(order.id, '123');
      expect(order.customerName, 'John Doe');
    });
  });
}
```

### Widget Tests

Test widget rendering and interactions:

```dart
// test/widgets/order_summary_card_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:delivery_man_app/widgets/order_summary_card.dart';

void main() {
  testWidgets('OrderSummaryCard displays order info', (tester) async {
    final order = Order(/* ... */);
    
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: OrderSummaryCard(order: order),
        ),
      ),
    );
    
    expect(find.text('Order #${order.id}'), findsOneWidget);
  });
}
```

### Integration Tests

Test complete user flows in `integration_test/` directory.

## Pull Request Process

1. **Update Documentation**: Update README.md, ARCHITECTURE.md, or other docs if needed

2. **Add Tests**: Ensure new features have appropriate test coverage

3. **Run Checks**:
   ```bash
   flutter analyze
   flutter test
   flutter build apk --debug  # Ensure it builds
   ```

4. **Create Pull Request**:
   - Use a descriptive title
   - Reference any related issues
   - Provide a clear description of changes
   - Include screenshots for UI changes
   - List any breaking changes

5. **PR Template**:
   ```markdown
   ## Description
   Brief description of changes
   
   ## Type of Change
   - [ ] Bug fix
   - [ ] New feature
   - [ ] Breaking change
   - [ ] Documentation update
   
   ## Testing
   - [ ] Unit tests pass
   - [ ] Widget tests added/updated
   - [ ] Manual testing completed
   
   ## Screenshots (if applicable)
   
   ## Checklist
   - [ ] Code follows style guidelines
   - [ ] Self-reviewed code
   - [ ] Commented complex code
   - [ ] Updated documentation
   - [ ] No new warnings
   ```

## Code Review Guidelines

### For Reviewers

- Be respectful and constructive
- Focus on code quality and maintainability
- Check for:
  - Code style compliance
  - Test coverage
  - Performance implications
  - Security concerns
  - Documentation completeness

### For Contributors

- Respond to feedback promptly
- Don't take criticism personally
- Ask for clarification if needed
- Update PR based on feedback
- Mark conversations as resolved

## Common Issues and Solutions

### Issue: Build fails with dependency errors
**Solution**: 
```bash
flutter clean
flutter pub get
flutter pub upgrade
```

### Issue: Hot reload not working
**Solution**: 
- Restart the app
- Run `flutter clean` and rebuild

### Issue: Provider state not updating
**Solution**: 
- Ensure `notifyListeners()` is called
- Check if widget is wrapped with `Consumer` or using `Provider.of(listen: true)`

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- [Provider Package](https://pub.dev/packages/provider)
- [Flutter Testing](https://flutter.dev/docs/testing)

## Questions?

If you have questions or need help:
1. Check existing issues and discussions
2. Create a new issue with the `question` label
3. Contact the development team

Thank you for contributing! 🎉
