import 'package:flutter/material.dart';
import 'progress_chart.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(), // Ensure LoginPage is properly imported
    );
  }
}
