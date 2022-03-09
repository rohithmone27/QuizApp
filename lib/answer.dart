import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectedRadioValue;
  var selectRadio;
  String answerText;
  Answer(this.selectedRadioValue, this.selectRadio ,this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RadioListTile(
        title: Text(answerText),
        value: answerText, 
        groupValue: selectRadio, 
        activeColor: Colors.green,
        onChanged: (val){
          selectedRadioValue(val);
        })
    );
  }
}
