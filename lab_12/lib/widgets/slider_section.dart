import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/container_provider.dart';

class SliderSection extends StatelessWidget {
  const SliderSection({super.key});

  Widget buildSlider({
    required String label,
    required double value,
    required double min,
    required double max,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(label), Text(value.toStringAsFixed(0))],
        ),
        Slider(
          min: min,
          max: max,
          divisions: (max - min).toInt(),
          value: value,
          label: value.toStringAsFixed(0),
          onChanged: onChanged,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ContainerProvider>();

    return Column(
      children: [
        buildSlider(
          label: 'Width',
          value: state.width,
          min: 50,
          max: 250,
          onChanged: state.setWidth,
        ),
        buildSlider(
          label: 'Height',
          value: state.height,
          min: 50,
          max: 250,
          onChanged: state.setHeight,
        ),
        buildSlider(
          label: 'Top right radius',
          value: state.radius,
          min: 0,
          max: 100,
          onChanged: state.setRadius,
        ),
        const SizedBox(height: 16),
        OutlinedButton.icon(
          onPressed: () {
            context.read<ContainerProvider>().reset();
          },
          icon: const Icon(Icons.refresh),
          label: const Text('Reset'),
        ),
      ],
    );
  }
}
