import 'package:flutter/material.dart';
import 'constants/app_constants.dart';
import 'widgets/avarage_calculate_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Constants.myTheme,
      title: "Dynamic Notion Avarage App",
      home: CalculateAvarageApp(),
    );
  }
}