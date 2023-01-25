import 'package:bmi_calculater/style/colors.dart';
import 'package:flutter/material.dart';

import '../../calc_result.dart';
import '../../shared/shared.dart';

class BMIResultScreen extends StatelessWidget {
  final double result;
  final bool isMale;
  final int age;
  const BMIResultScreen(this.result, this.isMale, this.age, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'BMI Result',
          style: textStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              'Your Result',
              style: textStyle(fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: lightBlack, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Text(
                  getResult(result),
                  style: textStyle(color: getColor(result), fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    '${result.round()}',
                    style: textStyle(fontSize: 40),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    getInerpretation(result),
                    textAlign: TextAlign.center,
                    style: textStyle(),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 90,
          ),
          Container(
            width: double.infinity,
            color: red,
            child: MaterialButton(
              height: 50,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Re-Calculate',
                style: textStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
