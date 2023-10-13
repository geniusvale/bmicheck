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
    super.initState();
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
        minimum: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          children: [
            const Text(
              'Your Current BMI',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            Text(
              widget.bmiScore.toStringAsFixed(2),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
              width: double.infinity,
              height: 360,
              color: Colors.grey,
            ),
            const Text(
                'For your height, a normal weight range would be from 59.9 to 81.0 kilograms.'),
            Text(
                'Your BMI is ${widget.bmiScore.toStringAsFixed(2)}, indicating your weight is in the Normal category for adults of your height.'),
            const Text(
                'Mantaining a healthy weight offers benefits such as reduced risk of chronic diseases, improved mental well-being, and increased longevity.'),
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
