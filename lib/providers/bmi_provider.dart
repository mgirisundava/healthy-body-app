import 'dart:math';

import 'package:flutter/material.dart';
import 'package:healthy_body_app/theme.dart';

class BmiProvider with ChangeNotifier {
// WEIGHT
  double _weight = 50;
  double get weight => _weight;

  set weight(double newValue) {
    _weight = newValue;
    notifyListeners();
  }

  void weightIncrement() {
    final newWeight = weight + 1;
    weight = newWeight;
    notifyListeners();
  }

  void weightDecrement() {
    final newWeight = weight - 1;
    weight = newWeight;
    notifyListeners();
  }

//HEIGHT
  double _height = 160;
  double get height => _height;

  set height(double newValue) {
    _height = newValue;
    notifyListeners();
  }

  void heightIncrement() {
    final newHeight = height + 1;
    height = newHeight;
    notifyListeners();
  }

  void heightDecrement() {
    final newHeight = height - 1;
    height = newHeight;
    notifyListeners();
  }

  void changeHeight(double value) {
    height = value;
    notifyListeners();
  }

// CALCULATOR

  double? _bmi;

  double get bmi => _bmi!;

  String calculateBMI(double weight, double height) {
    _bmi = weight / pow(height / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getResult(bmiResult) {
    if (_bmi != null) {
      if (_bmi! >= 25) {
        return 'OVERWEIGHT';
      } else if (_bmi! >= 18.5) {
        return 'NORMAL';
      } else {
        return 'UNDERWEIGHT';
      }
    } else {
      return 'UNSPECIFIED';
    }
  }

  Color? getResultColor(bmiResult) {
    if (_bmi != null) {
      if (_bmi! >= 25) {
        return orangeColor; // Orange
      } else if (_bmi! >= 18.5) {
        return greenColor; // Green
      } else {
        return yellowColor; // Yellow
      }
    } else {
      return null;
    }
  }

  String getInterpretation(bmiResult) {
    if (_bmi != null) {
      if (_bmi! >= 25) {
        return 'You have a higher than normal body\nweight. Try to exercise more.';
      } else if (_bmi! >= 18.5) {
        return 'You have a normal body weight.\nGood job!';
      } else {
        return 'You have a lower than normal body\nweight. You can eat a bit more.';
      }
    } else {
      return 'UNSPECIFIED';
    }
  }
}
