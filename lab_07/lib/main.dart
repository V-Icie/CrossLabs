import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 07',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const ConfiguratorScreen(),
    );
  }
}

class ConfiguratorScreen extends StatefulWidget {
  const ConfiguratorScreen({super.key});

  @override
  State<ConfiguratorScreen> createState() =>
      _ConfiguratorScreenState();
}

class _ConfiguratorScreenState
    extends State<ConfiguratorScreen> {
  double topLeft = 0;
  double topRight = 0;
  double bottomLeft = 0;
  double bottomRight = 0;

  void reset() {
    setState(() {
      topLeft = 0;
      topRight = 0;
      bottomLeft = 0;
      bottomRight = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 07 | Corner Configurator'),
        backgroundColor:
            Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 500,
              ),
              child: Column(
                children: [
                  const Text(
                    'Container preview',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(topLeft),
                        topRight: Radius.circular(topRight),
                        bottomLeft: Radius.circular(bottomLeft),
                        bottomRight: Radius.circular(bottomRight),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  CornerSlider(
                    label: 'Top left',
                    value: topLeft,
                    onChanged: (value) {
                      setState(() => topLeft = value);
                    },
                  ),

                  CornerSlider(
                    label: 'Top right',
                    value: topRight,
                    onChanged: (value) {
                      setState(() => topRight = value);
                    },
                  ),

                  CornerSlider(
                    label: 'Bottom left',
                    value: bottomLeft,
                    onChanged: (value) {
                      setState(() => bottomLeft = value);
                    },
                  ),

                  CornerSlider(
                    label: 'Bottom right',
                    value: bottomRight,
                    onChanged: (value) {
                      setState(() => bottomRight = value);
                    },
                  ),

                  const SizedBox(height: 16),

                  OutlinedButton.icon(
                    onPressed: reset,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Reset'),
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    'Trots Oleksandr | IPZ-33',
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

class CornerSlider extends StatelessWidget {
  final String label;
  final double value;
  final ValueChanged<double> onChanged;

  const CornerSlider({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Text(value.toStringAsFixed(0)),
          ],
        ),
        Slider(
          min: 0,
          max: 75,
          divisions: 75,
          value: value,
          label: value.toStringAsFixed(0),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
