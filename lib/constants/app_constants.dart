import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  
  static ThemeData myTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: mainColor,
  brightness: Brightness.light,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity
);

  static const Color mainColor = Colors.teal;
  static const String titleText = "Calculate Avarage";
  static final TextStyle titleStyle = GoogleFonts.quicksand(fontSize: 24 , fontWeight: FontWeight.w900 , color: mainColor);

  static BorderRadius borderRadius = BorderRadius.circular(16);
  static final dropDownPadding = EdgeInsets.symmetric(horizontal: 6,vertical: 6);

  static final TextStyle lessonnumberStyle = GoogleFonts.quicksand(fontSize: 16 , fontWeight: FontWeight.w600 , color: mainColor);
  static final TextStyle avaragenumberStyle = GoogleFonts.quicksand(fontSize: 55 , fontWeight: FontWeight.w800 , color: mainColor);
  static final TextStyle AvarageShowStyle = GoogleFonts.quicksand(fontSize: 16 , fontWeight: FontWeight.w600 , color: mainColor);

  static final Y8Padding =  EdgeInsets.symmetric(horizontal: 8);

}