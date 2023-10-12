import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  RulerPickerController? _rulerPickerController;
  num currentValue = 100;

  @override
  Widget build(BuildContext context) {
    List<RulerRange> ranges = const [
      // RulerRange(begin: 0, end: 10, scale: 0.1),
      // RulerRange(begin: 10, end: 100, scale: 1),
      RulerRange(begin: 100, end: 500, scale: 1),
      // RulerRange(begin: 1000, end: 10000, scale: 100),
      // RulerRange(begin: 10000, end: 100000, scale: 1000)
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Your Information',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Choose your gender : '),
            const SizedBox(height: 32),
            Center(
              child: ToggleSwitch(
                minWidth: 100.0,
                minHeight: 48,
                initialLabelIndex: 1,
                cornerRadius: 20.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                totalSwitches: 2,
                labels: const ['Male', 'Female'],
                icons: const [FontAwesomeIcons.mars, FontAwesomeIcons.venus],
                activeBgColors: const [
                  [Colors.blue],
                  [Colors.pink]
                ],
                onToggle: (index) {
                  print('switched to: $index');
                },
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Height'),
                Text('cm'),
              ],
            ),
            const SizedBox(height: 32),
            Center(
              child: Text(
                currentValue.toString(),
                style: const TextStyle(fontSize: 64),
              ),
            ),
            RulerPicker(
              controller: _rulerPickerController,
              onBuildRulerScaleText: (index, value) {
                return value.toInt().toString();
              },
              ranges: ranges,
              scaleLineStyleList: const [
                ScaleLineStyle(
                    color: Colors.grey, width: 1.5, height: 30, scale: 0),
                ScaleLineStyle(
                    color: Colors.grey, width: 1, height: 25, scale: 5),
                ScaleLineStyle(
                    color: Colors.grey, width: 1, height: 15, scale: -1)
              ],
              onValueChanged: (value) {
                setState(() {
                  currentValue = value;
                });
              },
              width: MediaQuery.of(context).size.width,
              height: 80,
              rulerMarginTop: 8,
              marker: Container(
                width: 8,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue.withAlpha(100),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 150,
                  height: 150,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: const [
                      Text('Weight (kg)'),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 150,
                  height: 150,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      const Text('Age'),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add),
                            ),
                            const Text('12'),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.remove),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Calculate'),
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
