import 'package:dynamic_notion_avarage/model/lesson.dart';
import 'package:flutter/material.dart';

class DataHelper {

  static List<Lesson> allAddedCourse = [];

  static addCourse(Lesson course){
    allAddedCourse.add(course);
  }

  static double calculateAvarage(){
    double sumNote = 0;
    double sumCredit = 0;

    allAddedCourse.forEach((element){
      sumNote = sumNote + (element.creditValue * element.letterValue);
      sumCredit = sumCredit + (element.creditValue);
    });

    return sumNote / sumCredit;
  }


  static List<String> _allLessonLetter(){
    return ["AA","BA","BB","CB","CC","DC","DD","FF"];
  }

  static double _letterConverNote(String letter){
    switch(letter){
      case "AA":
      return 4;
      case "BA":
      return 3.5;
      case "BB":
      return 3.0;
      case "CB":
      return 2.5;
      case "CC":
      return 2.0;
      case "DC":
      return 1.5;
      case "DD":
      return 1.0;
      case "FF":
      return 0.0;

      default :
      return -1;
    } 
  }

  static List<DropdownMenuItem<double>> allLessonLetter(){
    return _allLessonLetter().map((toElement) => DropdownMenuItem(child: Text(toElement),value: _letterConverNote(toElement),)).toList();
  }

  static List<int> _allCredit(){
    return List.generate(10, (index)=> index +1).toList();
  }

  static List<DropdownMenuItem<double>>allLessonCredit(){
    return _allCredit().map((toElement) => DropdownMenuItem(child: Text(toElement.toString()),value: toElement.toDouble(),),).toList();
  }

}