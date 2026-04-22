import 'package:flutter/material.dart';
import 'home_page_part2.dart'; // Import halaman home part 2
import 'pbb1.dart';
import 'pbb2.dart';
import 'layanan_keliling.dart';
import 'detail_sppt.dart';
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
  home: const HomePage2(), // Ganti dari PBB2() ke HomePagePart2()
);
  }
}
