import 'package:flutter/material.dart';

class BMI extends StatelessWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          children: const [
            Text('Choose your gender : '),
            
          ],
        ),
      ),
    );
  }
}
