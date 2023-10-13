import 'package:bmicheck/styles.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  double bmiScore;

  Result({Key? key, required this.bmiScore}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  void initState() {
    category();
    super.initState();
  }

  String bmiCategory = '';

  void category() {
    if (widget.bmiScore >= 30) {
      bmiCategory = 'Obese';
    } else if (widget.bmiScore >= 25) {
      bmiCategory = 'Overweight';
    } else if (widget.bmiScore >= 18.5) {
      bmiCategory = 'Normal';
    } else {
      bmiCategory = 'Underweight';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: darkBlue),
        title: Text(
          'My Result',
          style: TextStyle(color: darkBlue, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Column(
          children: [
            const Text(
              'Your Current BMI',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            Text(
              widget.bmiScore.toStringAsFixed(2),
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: lightBlue),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
              width: double.infinity,
              height: 360,
              color: Colors.grey,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: const Text(
                  'For your height, a normal weight range would be from 59.9 to 81.0 kilograms.'),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: RichText(
                text: TextSpan(
                  text: 'Your BMI is ',
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: '${widget.bmiScore.toStringAsFixed(2)}, ',
                      style: const TextStyle(color: Colors.green),
                    ),
                    const TextSpan(
                      text: 'indicating your weight is in the ',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: bmiCategory,
                      style: const TextStyle(color: Colors.green),
                    ),
                    const TextSpan(
                      text: ' category for adults of your height.',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: const Text(
                'Mantaining a healthy weight offers benefits such as reduced risk of chronic diseases, improved mental well-being, and increased longevity.',
                style: TextStyle(
                  height: 1.5,
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Recalculate BMI'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
