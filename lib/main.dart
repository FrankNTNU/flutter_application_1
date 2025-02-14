import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('Hello World!');
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          // 測試 commit 1
          // 測試 commit 2
          child: Text('Hello World!', style: TextStyle(fontSize: 36)),
        ),
      ),
    );
  }
}
