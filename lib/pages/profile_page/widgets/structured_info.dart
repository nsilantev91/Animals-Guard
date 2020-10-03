import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './list_item.dart';

class StructuredInfo extends StatelessWidget {
  final double height;
  final double width;

  StructuredInfo(this.height, this.width);

  double _adaptationHeight(double myHeight) {
    return height * (myHeight / 740);
  }

  double _adaptationWidth(double myWidth) {
    return width * (myWidth / 360);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: _adaptationWidth(20)),
          child: Align(
            alignment: Alignment.topLeft,
            child: ListTile(
              title: Text(
                "Основные данные",
                style: Theme.of(context).textTheme.subhead,
              ),
              trailing: GestureDetector(
                onTap: () {
                },
                child: Icon(Icons.edit),
              ),
            ),
          ),
        ),
        SizedBox(
          height: _adaptationHeight(12),
        ),
        ListItem(
          "Фамилия",
          '',
          height,
          width,
        ),
        ListItem(
          "Имя",
          '',
          height,
          width,
        ),
        ListItem(
            "Пол",
            '',
            height,
            width),
        ListItem(
          "Телефон",
              '',
          height,
          width,
        ),
        ListItem(
          "E-mail",
          '',
          height,
          width,
        ),
        ListItem(
            "Дата рождения",
            '',
            height,
            width),
        SizedBox(
          height: _adaptationHeight(20),
        ),
      ],
    );
  }
}
