
class Calc {
  final double rangeFrom;
  final double rangeTo;

  double _step = 0.1;
  double? _result;

  Calc(this.rangeFrom, this.rangeTo) {
    if (rangeFrom > rangeTo) {
      throw ArgumentError('Invalid range');
    }
  }

  double? get result => _result;
  double get step => _step;

  void setStep(double value) {
    if (!value.isFinite || value <= 0) {
      throw ArgumentError('Step must be positive and finite');
    }

    _step = value;
    _result = null;
  }

  double _calc(double x) {
    return (x * x * x - 3) * (x * x + 3);
  }

  void runCalc() {
    double sum = 0.0;
    final int steps =
        ((rangeTo - rangeFrom) / _step + 1e-9).floor();

    for (int i = 0; i <= steps; i++) {
      final double x = rangeFrom + i * _step;
      final double y = _calc(x);

      print(
        'x = ${x.toStringAsFixed(2)}, '
        'y = ${y.toStringAsFixed(6)}',
      );

      sum += y;
    }

    _result = sum;
  }
}
