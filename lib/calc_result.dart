import 'package:bmi_calculater/style/colors.dart';

String getResult(double bmi) {
  if (bmi >= 25) {
    return 'Overweight';
  } else if (bmi > 18.5) {
    return 'Normal';
  } else {
    return 'Underweight';
  }
}

String getInerpretation(double bmi) {
  if (bmi >= 25) {
    return 'You have a higher than normal body weight. Try to exercise more';
  } else if (bmi > 18.5) {
    return 'You have a normal body weight. Good Job!';
  } else {
    return 'You have a lower than normal body weight. You can eat a bit more.';
  }
}

getColor(double bmi) {
  if (bmi >= 25) {
    return red;
  } else if (bmi > 18.5) {
    return green;
  } else {
    return red;
  }
}
