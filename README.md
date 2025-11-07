# 🎨 FluiKit

**Flutter UI Kit** - A comprehensive component library for Flutter applications.

A collection of reusable Flutter components designed to accelerate your development workflow.

---

## ✨ Features

- 🎯 **Essential UI Components** - Buttons, dropdowns, inputs, and more
- ⚡ **Optimized Performance** - Lightweight and efficient
- 🔧 **Easy Integration** - Simple setup and intuitive API
---

## 📦 Installation

Add FluiKit to your `pubspec.yaml`:

```yaml
dependencies:
  fluikit:
    git:
      url: https://github.com/RaulCatalinas/Fluikit.git
      ref: main
```

## 🚀 Quick Start

### 1. Import FluiKit

```dart
import 'package:fluikit/widgets.dart';
import 'package:fluikit/dialogs.dart';
```

### 2. Use Components

```dart
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FluiAppBar(actions: [Text('FluiKit Demo')]),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FluiReadOnlyInput(
                placeholder: "Directory to save the download"
            )
            SizedBox(height: 16),
            FluiButton(
              onPressed: () {
                FluiAlertDialog.show(
                  context,
                  title: 'Hello!',
                  content: 'Welcome to FluiKit',
                );
              },
              child: FluiText('Show Alert'),
            ),
          ],
        ),
      ),
    );
  }
}
```

## 🌟 Examples

### Complete Form Example

```dart
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FluiText(text: 'Login', fontSize: 20),
            SizedBox(height: 24),
            FluiInput(
              placeholder: 'your@email.com',
            ),
            SizedBox(height: 16),
            FluiInput(
              placeholder: 'Password',
            ),
            SizedBox(height: 24),
            FluiButton(
              onPressed: _handleLogin,
              child: FluiText('Sign In'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleLogin() async {
    print('Signing in...');
    
    // Simulate API call
    await Future.delayed(Duration(seconds: 2));
    
    FluiSuccessDialog.show(
      context,
      title: 'Welcome!',
      content: 'You have successfully signed in',
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
```

## 🤝 Contributing

Contributions are welcome! This is a personal project, but feel free to:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 📬 Contact

For questions, suggestions, or feedback:

- GitHub: [Raul Catalinas](https://github.com/RaulCatalinas)
- Email: raulcatalinas@gmail.com

---

Made with ❤️ for Flutter developers