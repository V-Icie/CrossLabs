import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = ColorScheme.fromSeed(
      seedColor: Colors.indigo,
      brightness: Brightness.dark,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 08',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: scheme,
        scaffoldBackgroundColor: const Color(0xFF101522),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF192338),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),

        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(fontSize: 16),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF1B2538),
          contentPadding: const EdgeInsets.all(18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Color(0xFF41516C),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.lightBlueAccent,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.redAccent,
            ),
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigoAccent,
            foregroundColor: Colors.white,
            minimumSize: const Size(0, 52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),

        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.lightBlueAccent,
            minimumSize: const Size(0, 52),
            side: const BorderSide(
              color: Colors.lightBlueAccent,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.lightBlueAccent,
          ),
        ),
      ),
      home: const AuthScreen(mode: 0),
    );
  }
}

class AuthScreen extends StatefulWidget {
  final int mode;

  const AuthScreen({
    super.key,
    required this.mode,
  });

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final formKey = GlobalKey<FormState>();

  String get title {
    switch (widget.mode) {
      case 1:
        return 'Sign up';
      case 2:
        return 'Reset password';
      default:
        return 'Login';
    }
  }

  IconData get screenIcon {
    switch (widget.mode) {
      case 1:
        return Icons.person_add_alt_1;
      case 2:
        return Icons.lock_reset;
      default:
        return Icons.account_circle;
    }
  }

  Widget buildField(
    String label,
    IconData icon, {
    bool obscure = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: TextFormField(
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
          return null;
        },
      ),
    );
  }

  void submit() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: const Text(
          'Form submitted successfully',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void openScreen(int mode) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AuthScreen(mode: mode),
      ),
    );
  }

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
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const FlutterLogo(size: 70),

                    const SizedBox(height: 18),

                    Icon(
                      screenIcon,
                      size: 48,
                      color: Colors.lightBlueAccent,
                    ),

                    const SizedBox(height: 16),

                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme.headlineMedium,
                    ),

                    const SizedBox(height: 30),

                    if (widget.mode == 1)
                      buildField(
                        'Name',
                        Icons.badge_outlined,
                      ),

                    if (widget.mode != 2) ...[
                      buildField(
                        'Login',
                        Icons.person_outline,
                      ),
                      buildField(
                        'Password',
                        Icons.lock_outline,
                        obscure: true,
                      ),
                    ] else
                      buildField(
                        'Email',
                        Icons.email_outlined,
                      ),

                    ElevatedButton(
                      onPressed: submit,
                      child: Text(title),
                    ),

                    const SizedBox(height: 12),

                    OutlinedButton(
                      onPressed: () {
                        if (widget.mode == 0) {
                          openScreen(1);
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        widget.mode == 0
                            ? 'Sign up'
                            : 'Back',
                      ),
                    ),

                    if (widget.mode == 0)
                      TextButton(
                        onPressed: () => openScreen(2),
                        child: const Text(
                          'Forgot password?',
                        ),
                      ),

                    const SizedBox(height: 24),

                    const Text(
                      'Trots Oleksandr | IPZ-33',
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Laboratory work No. 8',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
