import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/container_provider.dart';

class ContainerPreview extends StatelessWidget {
  const ContainerPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ContainerProvider>();

    return SizedBox(
      height: 270,
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width: state.width,
          height: state.height,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(state.radius),
            ),
          ),
        ),
      ),
    );
  }
}
