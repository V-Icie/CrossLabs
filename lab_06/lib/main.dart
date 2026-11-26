import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Lab 06',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

void showMessage(BuildContext context, String message) {
  showDialog<void>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Message'),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

class AuthField extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool obscure;

  const AuthField({
    super.key,
    required this.label,
    required this.icon,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

class AuthLayout extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const AuthLayout({
    super.key,
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 400,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(icon, size: 85),
                  const SizedBox(height: 20),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ...children,
                  const SizedBox(height: 24),
                  const Text(
                    'Trots Oleksandr | IPZ-33',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: 'Login',
      icon: Icons.account_circle,
      children: [
        const AuthField(
          label: 'Login',
          icon: Icons.person_outline,
        ),
        const AuthField(
          label: 'Password',
          icon: Icons.lock_outline,
          obscure: true,
        ),
        ElevatedButton(
          onPressed: () {
            showMessage(context, 'Login requested');
          },
          child: const Text('Login'),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const SignupScreen(),
              ),
            );
          },
          child: const Text('Sign up'),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ResetScreen(),
              ),
            );
          },
          child: const Text('Forgot password?'),
        ),
      ],
    );
  }
}

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: 'Sign up',
      icon: Icons.person_add_alt_1,
      children: [
        const AuthField(
          label: 'Name',
          icon: Icons.badge_outlined,
        ),
        const AuthField(
          label: 'Login',
          icon: Icons.person_outline,
        ),
        const AuthField(
          label: 'Password',
          icon: Icons.lock_outline,
          obscure: true,
        ),
        ElevatedButton(
          onPressed: () {
            showMessage(context, 'Registration requested');
          },
          child: const Text('Sign up'),
        ),
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Back'),
        ),
      ],
    );
  }
}

class ResetScreen extends StatelessWidget {
  const ResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: 'Reset password',
      icon: Icons.lock_reset,
      children: [
        const AuthField(
          label: 'Email',
          icon: Icons.email_outlined,
        ),
        ElevatedButton(
          onPressed: () {
            showMessage(context, 'Password reset requested');
          },
          child: const Text('Reset password'),
        ),
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Back'),
        ),
      ],
    );
  }
}
