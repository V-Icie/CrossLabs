
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 1. Вимкнено банер DEBUG.
      debugShowCheckedModeBanner: false,

      // 2. Змінено основний колір теми.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),
        useMaterial3: true,
      ),

      // 3. Змінено заголовок застосунку.
      home: const MyHomePage(
        title: 'Lab 04 | Trots Oleksandr | IPZ-33',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 4. Змінено початкове значення лічильника.
  int _counter = 10;

  void _incrementCounter() {
    setState(() {
      // 5. Змінено крок збільшення лічильника.
      _counter += 5;
    });
  }

  // 6. Додано функцію зменшення лічильника.
  void _decrementCounter() {
    setState(() {
      _counter -= 5;
    });
  }

  // 7. Додано функцію скидання лічильника.
  void _resetCounter() {
    setState(() {
      _counter = 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),

        // 8. Заголовок розташовано по центру.
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Current counter value:'),
            const SizedBox(height: 20),

            // 9. Змінено оформлення значення лічильника.
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.teal.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '$_counter',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // 10. Додано панель кнопок керування.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: const Text('-5'),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: _resetCounter,
                  child: const Text('Reset'),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Text('+5'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
