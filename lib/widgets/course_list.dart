import 'package:dynamic_notion_avarage/constants/app_constants.dart';
import 'package:dynamic_notion_avarage/helper/data_helper.dart';
import 'package:flutter/material.dart';

class CourseLisr extends StatefulWidget {
  const CourseLisr({super.key});

  @override
  State<CourseLisr> createState() => _CourseLisrState();
}

class _CourseLisrState extends State<CourseLisr> {
  @override
  Widget build(BuildContext context) {
    List allLesson = DataHelper.allAddedCourse; 
    return allLesson.length > 0 ? ListView.builder(itemCount:allLesson.length,itemBuilder: (context , index){
      return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        onDismissed: (a){
          allLesson.removeAt(index);
          setState(() {
            
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            child: ListTile(
              title: Text(allLesson[index].name),
              leading: CircleAvatar(
                backgroundColor: Constants.mainColor ,
                child: Text((allLesson[index].letterValue * allLesson[index].creditValue).toStringAsFixed(0)),
              ),
              subtitle: Text(
                "${allLesson[index].creditValue} Credi , Not : ${allLesson[index].letterValue}"
              ),
            ),
          ),
        ),
      );
    }) : Center(child: Container(child: Text("Lutfen ders ekleyin",style: Constants.titleStyle,),));
  }
}