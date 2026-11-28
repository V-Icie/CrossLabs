import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

enum PreviewResult { ok, cancel }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 10',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const EditorScreen(),
    );
  }
}

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  final TextEditingController controller = TextEditingController();

  double fontSize = 24;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> openPreview() async {
    if (controller.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter some text')));
      return;
    }

    FocusScope.of(context).unfocus();

    final result = await Navigator.push<PreviewResult>(
      context,
      MaterialPageRoute(
        builder: (_) =>
            PreviewScreen(text: controller.text, fontSize: fontSize),
      ),
    );

    if (!mounted) return;

    final String message;

    switch (result) {
      case PreviewResult.ok:
        message = 'Cool!';
        break;
      case PreviewResult.cancel:
        message = 'Let\u2019s try something else';
        break;
      case null:
        message = "Don't know what to say";
        break;
    }

    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(
          children: [
            Image.asset('assets/robot.png', width: 36, height: 36),
            const SizedBox(width: 12),
            const Text('Message'),
          ],
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text editor'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 450),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/robot.png', width: 100, height: 100),

                  const SizedBox(height: 24),

                  TextField(
                    controller: controller,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      labelText: 'Enter your text',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 24),

                  Text(
                    'Font size: ${fontSize.toInt()}',
                    style: const TextStyle(fontSize: 18),
                  ),

                  Slider(
                    min: 10,
                    max: 60,
                    divisions: 50,
                    value: fontSize,
                    label: fontSize.toInt().toString(),
                    onChanged: (value) {
                      setState(() {
                        fontSize = value;
                      });
                    },
                  ),

                  const SizedBox(height: 16),

                  ElevatedButton(
                    onPressed: openPreview,
                    child: const Text('Preview'),
                  ),

                  const SizedBox(height: 30),

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

class PreviewScreen extends StatelessWidget {
  final String text;
  final double fontSize;

  const PreviewScreen({super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: fontSize),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context, PreviewResult.cancel);
                      },
                      child: const Text('Cancel'),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, PreviewResult.ok);
                      },
                      child: const Text('Ok'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
