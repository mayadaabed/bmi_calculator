import 'dart:math';

import 'package:bmi_calculater/modules/bmi_result/bmi_result_screen.dart';
import 'package:bmi_calculater/style/colors.dart';
import 'package:flutter/material.dart';
import '../../shared/shared.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true;
  double height = 120.0;

  int weigth = 40;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: textStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: black,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isMale ? red : lightBlack),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(
                            image: AssetImage('assets/images/male.png'),
                            height: 60,
                            width: 60,
                            color: white,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text('Male',
                              style: textStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: !isMale ? Colors.blue : lightBlack),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(
                            image: AssetImage('assets/images/female.png'),
                            height: 60,
                            width: 60,
                            color: white,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Female',
                            style: textStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: lightBlack),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HIGHT',
                    style: textStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${height.round()}',
                        style: textStyle(
                            fontSize: 40, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'CM',
                        style: textStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  Slider(
                    value: height,
                    max: 220,
                    min: 80,
                    activeColor: red,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                  )
                ],
              ),
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: lightBlack),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: textStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$weigth',
                          style: textStyle(
                              fontSize: 30, fontWeight: FontWeight.w900),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            floatButton(
                              tag: 'weight--',
                              icon: Icons.remove,
                              function: () {
                                setState(() {
                                  weigth--;
                                });
                              },
                            ),
                            floatButton(
                              tag: 'weight++',
                              icon: Icons.add,
                              function: () {
                                setState(() {
                                  weigth++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: lightBlack),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: textStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$age',
                          style: textStyle(
                              fontSize: 30, fontWeight: FontWeight.w900),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            floatButton(
                              tag: 'age--',
                              icon: Icons.remove,
                              function: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            floatButton(
                              tag: 'age++',
                              icon: Icons.add,
                              function: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
          Container(
            width: double.infinity,
            color: red,
            child: MaterialButton(
              height: 50,
              onPressed: () {
                double result = weigth / pow(height / 100, 2);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          BMIResultScreen(result, isMale, age),
                    ));
              },
              child: Text(
                'Calculate',
                style: textStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
