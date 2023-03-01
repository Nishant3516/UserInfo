import 'package:flutter/material.dart';
import 'package:userassignment/pages/home_page.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    home: const MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
