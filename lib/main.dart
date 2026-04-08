import 'package:flutter/material.dart';
import 'pbb2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LaPak Bantul',
      home: const PBB2(),
    );
  }
}
