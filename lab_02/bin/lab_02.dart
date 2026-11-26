
void main() {
  const double valueFrom = -4.0;
  const double valueTo = 9.0;
  const double step = 0.5;

  double x = valueFrom + step;
  double sum = 0.0;
  int count = 0;

  print('Laboratory work No. 2');
  print('Trots Oleksandr, IPZ-33');
  print('Variant No. 20');
  print('y = x / (x^2 - 4)');
  print('Range: (-4; 9], step: 0.5\n');

  while (x <= valueTo) {
    if (x == -2.0 || x == 2.0) {
      print('x = ${x.toStringAsFixed(2)}, y = undefined');
    } else {
      final double y = calc(x);

      print(
        'x = ${x.toStringAsFixed(2)}, '
        'y = ${y.toStringAsFixed(6)}',
      );

      sum += y;
      count++;
    }

    x += step;
  }

  final double average = sum / count;

  print('\nNumber of valid values: $count');
  print('Arithmetic mean: ${average.toStringAsFixed(6)}');
}

double calc(double x) {
  return x / (x * x - 4);
}
