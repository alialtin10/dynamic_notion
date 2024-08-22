import 'package:dynamic_notion_avarage/constants/app_constants.dart';
import 'package:dynamic_notion_avarage/helper/data_helper.dart';
import 'package:flutter/material.dart';

class CreditDropdownWidget extends StatefulWidget {
  const CreditDropdownWidget({required this.onCredidChoose,super.key});
  
  final Function onCredidChoose;
  
  @override
  State<CreditDropdownWidget> createState() => _CreditDropdownWidgetState();
}

class _CreditDropdownWidgetState extends State<CreditDropdownWidget> {
  double secilenKrediDegeri = 1;
  @override
  Widget build(BuildContext context) {
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
          widget.onCredidChoose(secilenKrediDegeri);
        });
      },value: secilenKrediDegeri,
      underline: Container(),
      items: DataHelper.allLessonCredit()
      ),
      
    );
  }
}