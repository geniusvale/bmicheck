import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  RulerPickerController? _rulerPickerController;

  num currentHeight = 150;
  int currentWeight = 10;
  int currentAge = 10;
  int currentGenderCode = 0;

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
        title: Text(
          'Your Information',
          style:
              TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose your gender : ',
              style: TextStyle(
                  color: Colors.blue[900], fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            Center(
              child: ToggleSwitch(
                minWidth: 132.0,
                minHeight: 53,
                initialLabelIndex: 0,
                cornerRadius: 20.0,
                borderColor: const [Colors.grey],
                borderWidth: 1,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.white,
                inactiveFgColor: Colors.grey,
                activeBgColors: const [
                  [Colors.blue],
                  [Colors.pink]
                ],
                totalSwitches: 2,
                labels: const ['Male', 'Female'],
                icons: const [FontAwesomeIcons.mars, FontAwesomeIcons.venus],
                onToggle: (index) {
                  currentGenderCode = index!;
                  print(
                    'switched to: $index, current gender code = $currentGenderCode',
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Height',
                  style: TextStyle(
                      color: Colors.blue[900], fontWeight: FontWeight.bold),
                ),
                const Text('cm'),
              ],
            ),
            const SizedBox(height: 32),
            Center(
              child: Text(
                currentHeight.toString(),
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
                  currentHeight = value;
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
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 150,
                  height: 150,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(
                        'Weight (kg)',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 120,
                              height: 64,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(64),
                                  color: Colors.blue[100]),
                              child: WheelChooser.integer(
                                onValueChanged: (i) {
                                  currentWeight = i;
                                  print(currentWeight);
                                },
                                unSelectTextStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                                selectTextStyle: TextStyle(
                                  color: Colors.blue[900],
                                ),
                                horizontal: true,
                                listWidth: 100,
                                listHeight: 100,
                                maxValue: 200,
                                minValue: 1,
                                step: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 150,
                  height: 150,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(
                        'Age',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  currentAge++;
                                });
                              },
                              icon: const Icon(Icons.add),
                            ),
                            Text(
                              '$currentAge',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.blue[900],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  currentAge--;
                                });
                              },
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
