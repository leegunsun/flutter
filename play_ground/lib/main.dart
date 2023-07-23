import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

enum TestTestValue {
  test1,
  test2,
  test3,
}

enum TestRadioValue {
  test1,
  test2,
  test3,
}

class _MyAppState extends State<MyApp> {
  final List<bool> values = [false, false, false];
  TestRadioValue? selectValue;
  int voidcalltest = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Play ground',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Play ground'),
        ),
        body: Column(
          children: [
            Checkbox(
              value: values[0],
              onChanged: (value) => ChangeValue(0, values[0]),
            ),
            ListTile(
              leading: Radio<TestRadioValue>(
                  value: TestRadioValue.test1,
                  groupValue: selectValue,
                  onChanged: (value) => setState(() => selectValue = value!)),
              title: Text(TestRadioValue.test1.name),
              onTap: () => setState(() {
                if (selectValue != TestRadioValue.test1) {
                  selectValue = TestRadioValue.test1;
                }
              }),
            ),
            Radio<TestRadioValue>(
                value: TestRadioValue.test2,
                groupValue: selectValue,
                onChanged: (value) => setState(() => selectValue = value!)),
            Radio<TestRadioValue>(
                value: TestRadioValue.test3,
                groupValue: selectValue,
                onChanged: (value) => setState(() => selectValue = value!)),
            TestSlider(),
            TestSwitch(),
            TestPopupMenu(),
            Text('Count: $voidcalltest'),
            UpperCounter(upCountF)
          ],
        ),
      ),
    );
  }

  void upCountF(int index) => setState(() {
        voidcalltest = index + voidcalltest;
      });

  void ChangeValue(int index, bool value) {
    setState(() {
      values[index] = value;
    });
  }

  void ChangeRadio() {
    setState(() {});
  }
}

class UpperCounter extends StatelessWidget {
  const UpperCounter(this.callback, {super.key});

  final Function(int) callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => callback.call(5),
      onDoubleTap: () => callback.call(10),
      onLongPress: () => callback.call(20),
      child: Center(
          child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(border: Border.all(width: 1)),
        child: Text(
          'Up Counter',
          style: TextStyle(fontSize: 40),
        ),
      )),
    );
  }
}

class TestSlider extends StatefulWidget {
  const TestSlider({super.key});

  @override
  State<TestSlider> createState() => _TestSliderState();
}

class _TestSliderState extends State<TestSlider> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${value.round()}'),
        Slider(
            label: value.round().toString(),
            activeColor: Colors.accents[value.toInt() ~/ 24],
            divisions: 100,
            max: 100,
            min: 0,
            value: value,
            onChanged: (newValue) => setState(() {
                  value = newValue;
                })),
      ],
    );
  }
}

class TestSwitch extends StatefulWidget {
  const TestSwitch({super.key});

  @override
  State<TestSwitch> createState() => _TestSwitchState();
}

class _TestSwitchState extends State<TestSwitch> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: value,
          onChanged: (newValue) {
            print('$newValue');
            setState(() {
              value = newValue;
            });
          },
        ),
        CupertinoSwitch(
            value: value,
            onChanged: (newValue) => setState(() => value = newValue))
      ],
    );
  }
}

class TestPopupMenu extends StatefulWidget {
  const TestPopupMenu({super.key});

  @override
  State<TestPopupMenu> createState() => _TestPopupMenuState();
}

class _TestPopupMenuState extends State<TestPopupMenu> {
  TestTestValue testTestValue = TestTestValue.test1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(testTestValue.name),
        PopupMenuButton(
          itemBuilder: (context) {
            return TestTestValue.values
                .map((value) =>
                    PopupMenuItem(value: value, child: Text(value.name)))
                .toList();
          },
          onSelected: (newValue) => setState(() {
            testTestValue = newValue;
          }),
        ),
      ],
    );
  }
}
