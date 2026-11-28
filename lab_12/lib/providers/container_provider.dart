import 'package:flutter/material.dart';

class ContainerProvider extends ChangeNotifier {
  double _width = 150;
  double _height = 150;
  double _radius = 0;

  double get width => _width;
  double get height => _height;
  double get radius => _radius;

  void setWidth(double value) {
    _width = value;
    notifyListeners();
  }

  void setHeight(double value) {
    _height = value;
    notifyListeners();
  }

  void setRadius(double value) {
    _radius = value;
    notifyListeners();
  }

  void reset() {
    _width = 150;
    _height = 150;
    _radius = 0;
    notifyListeners();
  }
}
