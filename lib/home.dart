import 'package:bmicheck/bmi.dart';
import 'package:bmicheck/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => showAboutDialog(context: context, children: [
            const Text('Developed by : Ariiq Valerian Romero'),
            const SizedBox(height: 8),
            const Text(
              'Design by :\n https://www.behance.net/gallery/175522875/BMI-calculator-App-UI-Design',
            ),
          ]),
          icon: Icon(FontAwesomeIcons.circleInfo, color: darkBlue),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/healthyPeople.png'),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Calculate My BMI',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: darkBlue,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                'Discover your BMI with our app! Enter your height and weight to get valuable insights into yout health. Let\'s start your wellness journey today!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 2,
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BMI(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.arrow_right_alt_rounded),
                      label: const Text('Start'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        minimumSize: const Size(120, 48),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
