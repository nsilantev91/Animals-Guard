import 'package:animals_guard/helpers/helpers.dart';
import 'package:flutter/material.dart';

class Agreement extends StatefulWidget {
  @override
  _AgreementState createState() => _AgreementState();
}

class _AgreementState extends State<Agreement> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      onChanged: (val){
        setState(() {
          _value = val;
        });
      },
      value: _value,
      title: Text(
        "Я согласен/согласна на обработку персональных данных.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
          fontSize: Helpers.responsiveHeight(15, context)
        ),
      ),
      activeColor: Color(0xFFC5E2FF),
    );
  }
}