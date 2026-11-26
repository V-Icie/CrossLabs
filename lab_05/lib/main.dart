
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const double pixelSize = 50.0;
const double borderWidth = 1.0;
const double borderRadius = 10.0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 05',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow,
        ),
        useMaterial3: true,
      ),
      home: const PixelScreen(),
    );
  }
}

class PixelScreen extends StatelessWidget {
  const PixelScreen({super.key});

  static const List<List<int>> digit = [
    [0, 1, 1, 0],
    [1, 0, 0, 0],
    [1, 0, 0, 0],
    [1, 1, 1, 0],
    [1, 0, 0, 1],
    [1, 0, 0, 1],
    [0, 1, 1, 0],
  ];

  Widget buildPixel() {
    return Container(
      width: pixelSize,
      height: pixelSize,
      decoration: BoxDecoration(
        color: Colors.yellow,
        border: Border.all(
          color: Colors.grey,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }

  Widget buildEmpty() {
    return const SizedBox(
      width: pixelSize,
      height: pixelSize,
    );
  }

  Widget buildRow(List<int> row) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: row.map((value) {
        return value == 1 ? buildPixel() : buildEmpty();
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IPZ-33 | Oleksandr | Lab 05'),
        backgroundColor:
            Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: digit.map(buildRow).toList(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Variant No. 20'),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
