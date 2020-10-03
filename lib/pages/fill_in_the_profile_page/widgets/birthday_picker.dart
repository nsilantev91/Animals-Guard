import 'package:flutter/material.dart';

class BirthdayPicker extends StatefulWidget {
  @override
  _BirthdayPickerState createState() => _BirthdayPickerState();
}

class _BirthdayPickerState extends State<BirthdayPicker> {
  void _showPicker() {
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('День рождения'),
        ListTile(
          title: Text(
            '',
          ),
          trailing: IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: _showPicker,
          ),
        ),
      ],
    );
  }
}
