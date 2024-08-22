import 'package:dynamic_notion_avarage/constants/app_constants.dart';
import 'package:dynamic_notion_avarage/helper/data_helper.dart';
import 'package:flutter/material.dart';

class LetterDropdpwnWidgets extends StatefulWidget {
  const LetterDropdpwnWidgets({required this.onLetterChoose,super.key});
  final Function onLetterChoose;
  @override
  State<LetterDropdpwnWidgets> createState() => _LetterDropdpwnWidgetsState();
}

class _LetterDropdpwnWidgetsState extends State<LetterDropdpwnWidgets> {
  double secilenHarfDeger = 4;
  @override
  Widget build(BuildContext context) {
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
          widget.onLetterChoose(secilenHarfDeger);
        });
      },value: secilenHarfDeger,
      underline: Container(),
      items: DataHelper.allLessonLetter()
      ),
      
    );
  }
}