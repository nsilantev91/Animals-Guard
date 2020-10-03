import 'package:flutter/material.dart';

class ChooseGender extends StatefulWidget {
  ChooseGender({Key key}) : super(key: key);

  @override
  _ChooseGenderState createState() => _ChooseGenderState();
}

enum Gender { male, female }

class _ChooseGenderState extends State<ChooseGender> {
  Gender _character = null;

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('Пол:'),
          ListTile(
            title: const Text('Мужской'),
            leading: Radio(
              value: Gender.male,
              groupValue: _character,
              onChanged: (Gender value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Женский'),
            leading: Radio(
              value: Gender.female,
              groupValue: _character,
              onChanged: (Gender value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
