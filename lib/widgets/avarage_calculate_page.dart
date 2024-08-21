import 'package:dynamic_notion_avarage/constants/app_constants.dart';
import 'package:dynamic_notion_avarage/helper/data_helper.dart';
import 'package:dynamic_notion_avarage/model/lesson.dart';
import 'package:dynamic_notion_avarage/widgets/course_list.dart';
import 'package:dynamic_notion_avarage/widgets/show_avarage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class CalculateAvarageApp extends StatefulWidget {
  const CalculateAvarageApp({super.key});

  @override
  State<CalculateAvarageApp> createState() => _CalculateAvarageAppState();
}

class _CalculateAvarageAppState extends State<CalculateAvarageApp> {
  var formKey = GlobalKey<FormState>();
  double secilenHarfDeger = 4;
  double secilenKrediDegeri = 1;
  String inputLessonname = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        //elevation: 0,
        //backgroundColor: Theme.of(context).colorScheme.primary,
        title: Center(child: Text(Constants.titleText,style: Constants.titleStyle,),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(flex: 2,
                child: _buildForm(),
                ),
                Expanded(flex: 1,
                child: ShowAvarage(avarage: DataHelper.calculateAvarage(), numberOflesson: DataHelper.allAddedCourse.length),
                ),

            ],
          ),
          Expanded(
            child : CourseLisr()
          )
        ],
      )
    );
  }
  
Widget  _buildForm() {
  return Form(
    key: formKey,
    child: Column(
      children: [
        Padding(padding:Constants.Y8Padding ,child:_buildTextFomField(),),
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Expanded(child: Padding(padding: Constants.Y8Padding ,child: _buildHarfler(),)),
           Expanded(child: Padding(padding: Constants.Y8Padding ,child: _buildCredits(),)),
            
            IconButton(
              onPressed: _LessonAddedandAvarageCalculate, 
              icon: Icon(Icons.arrow_forward_ios_sharp),
              color: Constants.mainColor,
              iconSize: 30,
              ),
          ],
        ),
        SizedBox(height: 5,),

      ],
    ),
  );
}

Widget  _buildTextFomField() {
    return TextFormField(
      onSaved: (deger){
        setState(() {
          inputLessonname = deger!;
        });
      },
      validator: (s){
        if(s!.length <=0){return "Enter course name";}else{return null;}
      },
      decoration: InputDecoration(
        hintText: "Matematik",
        border: OutlineInputBorder(
          borderRadius: Constants.borderRadius,
          borderSide: BorderSide.none
        ),
        filled: true,
        fillColor: Constants.mainColor.withOpacity(0.3)

      ),
    );
  }
  
  _buildHarfler() {
    return Container(
      padding: Constants.dropDownPadding,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Constants.mainColor.withOpacity(0.3),
        borderRadius: Constants.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Colors.teal.shade200,
        onChanged: (deger){
        setState(() {
          secilenHarfDeger = deger!;
        });
      },value: secilenHarfDeger,
      underline: Container(),
      items: DataHelper.allLessonLetter()
      ),
      
    );
  }

    _buildCredits() {
    return Container(
      padding: Constants.dropDownPadding,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: Constants.mainColor.withOpacity(0.3),
        borderRadius: Constants.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Colors.teal.shade200,
        onChanged: (deger){
        setState(() {
          secilenKrediDegeri = deger!;
        });
      },value: secilenKrediDegeri,
      underline: Container(),
      items: DataHelper.allLessonCredit()
      ),
      
    );
  }
  
  _LessonAddedandAvarageCalculate() {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      var addCourse = Lesson(name: inputLessonname, letterValue: secilenHarfDeger, creditValue: secilenKrediDegeri);
      DataHelper.addCourse(addCourse);
      setState(() {
        
      });
    }
  }
}