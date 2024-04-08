import 'package:flutter/cupertino.dart';

class ResultViewModel with ChangeNotifier {
  double bmi = 0;
  String result = '저체중';

  void calcBMI(double height, double weight) {
    bmi = weight / ((height / 100.0) * (height / 100.0));
    calcBMIString(bmi);
    notifyListeners();
  }

  void calcBMIString(double bmi) {
    if (bmi >= 35) {
      result = '고도비만';
    } else if (bmi >= 30) {
      result = '2단계 비만';
    } else if (bmi >= 25) {
      result = '1단계 비만';
    } else if (bmi >= 23) {
      result = '과체중';
    } else if (bmi >= 18.5) {
      result = '정상';
    }
    notifyListeners();
  }
}
