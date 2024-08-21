import 'package:dynamic_notion_avarage/constants/app_constants.dart';
import 'package:flutter/material.dart';

class ShowAvarage extends StatelessWidget {
  final double avarage;
  final int numberOflesson;
  
  const ShowAvarage({required this.avarage,required this.numberOflesson,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(numberOflesson > 0 ? "$numberOflesson Lesson entered" : "Lesson choosed",
        style: Constants.lessonnumberStyle,
        ),
        Text(avarage >=0 ? "${avarage.toStringAsFixed(2)}":"0.0",style: Constants.avaragenumberStyle,),
        Text("Avarage" , style: Constants.AvarageShowStyle,)
      ],
    );
  }
}