import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthy_body_app/theme.dart';

class BrocaProvider with ChangeNotifier {
// ignore: todo
// TODO : GENDER PICKER

  bool _isMale = true;
  bool get isMale => _isMale;

  set isMale(bool newValue) {
    _isMale = newValue;
    notifyListeners();
  }

  get color => _isMale ? Colors.blue : Colors.pink;
  get maleColor => _isMale ? Colors.blue : thirdColor;
  get femaleColor => _isMale ? thirdColor : Colors.pink;

// ignore: todo
// TODO :  WEIGHT

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

// ignore: todo
// TODO : HEIGHT

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

// ignore: todo
// TODO : CALCULATE
  double? _broca;
  double? _brocaGeneral;
  double? _brocaMale;
  double? _brocaFemale;

  String brocaFormulaGeneral(double height) {
    _brocaGeneral = (height - 100).roundToDouble();
    return _brocaGeneral!.toStringAsFixed(1);
  }

  String brocaFormulaMale(double height) {
    _brocaMale = (height - 100) - (height - 100) * 10 / 100.round();
    return _brocaMale!.toStringAsFixed(1);
  }

  String brocaFormulaFemale(double height) {
    _brocaFemale = (height - 100) + (height - 100) * 15 / 100.round();
    return _brocaFemale!.toStringAsFixed(1);
  }

  String calculateBroca(bool isMale, double height) {
    _broca = isMale == true
        ? (height - 100) - (height - 100) * 10 / 100.roundToDouble()
        : (height - 100) - (height - 100) * 15 / 100.roundToDouble();
    return _broca!.toStringAsFixed(1);
  }
}
