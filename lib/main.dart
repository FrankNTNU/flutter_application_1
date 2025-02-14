import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ThreeCounters(),
      ),
    );
  }
}

class ThreeCounters extends StatefulWidget {
  const ThreeCounters({
    super.key,
  });

  @override
  State<ThreeCounters> createState() => _ThreeCountersState();
}

class _ThreeCountersState extends State<ThreeCounters> {
  var sums = [0, 0, 0];
  @override
  Widget build(BuildContext context) {
    int sum = sums[0] + sums[1] + sums[2];
    return ListView(
      children: [
        MyCounter(
            num: 0,
            onCounterChanged: (value) {
              setState(() {
                sums[0] = value;
              });
            }),
        MyCounter(
            num: 0,
            onCounterChanged: (value) {
              setState(() {
                sums[1] = value;
              });
            }),
        MyCounter(
            num: 0,
            onCounterChanged: (value) {
              setState(() {
                sums[2] = value;
              });
            }),
        Text(
          '三個數字的總和為: $sum',
          style: TextStyle(fontSize: 32),
        ),
      ],
    );
  }
}

class MyCounter extends StatefulWidget {
  // num 是初始值, onCounterChanged 是當數字改變時的 callback
  final int num;
  final Function(int) onCounterChanged;

  const MyCounter({
    super.key,
    required this.num,
    required this.onCounterChanged,
  });

  @override
  MyCounterState createState() => MyCounterState();
}

class MyCounterState extends State<MyCounter> {
  int myNumber = 0;

  @override
  void initState() {
    super.initState();
    myNumber = widget.num;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          myNumber.toString(),
          style: TextStyle(
              fontSize: 64,
              color: myNumber >= 0 ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  myNumber++;
                  widget.onCounterChanged(myNumber);
                });
              },
              icon: Icon(Icons.add, size: 64),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  myNumber--;
                  widget.onCounterChanged(myNumber);
                });
              },
              icon: Icon(Icons.remove, size: 64),
            ),
          ],
        )
      ],
    );
  }
}
