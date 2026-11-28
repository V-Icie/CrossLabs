import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/container_provider.dart';
import 'widgets/container_preview.dart';
import 'widgets/slider_section.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ContainerProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 12',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const ConfiguratorScreen(),
    );
  }
}

class ConfiguratorScreen extends StatelessWidget {
  const ConfiguratorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 12 | Provider'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: const Column(
                children: [
                  Text(
                    'Container configurator',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  ContainerPreview(),
                  SliderSection(),
                  SizedBox(height: 24),
                  Text('Trots Oleksandr | IPZ-33'),
                  SizedBox(height: 8),
                  Text('Variant No. 1'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
