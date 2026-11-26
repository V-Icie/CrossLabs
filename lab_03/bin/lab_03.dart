
import 'package:lab_03/calc.dart';

void main() {
  print('Laboratory work No. 3');
  print('Trots Oleksandr, IPZ-33');
  print('Variant No. 20');
  print('y = (x^3 - 3) * (x^2 + 3)');

  final processor = Calc(-2.0, 2.0);

  print('Range: [-2; 2]');
  print('Default step: ${processor.step}');

  processor.setStep(0.5);

  print('Modified step: ${processor.step}\n');

  processor.runCalc();

  print('\nSum: ${processor.result?.toStringAsFixed(6)}');
}
