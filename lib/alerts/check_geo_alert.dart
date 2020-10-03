import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animals_guard/models/point.dart';

Future<void> checkGeoDialog(BuildContext context, Point address) async {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Внимание! Проверьте адрес:\n" + address.caption),
          content: SingleChildScrollView(
            child: Column(
              children: [
                RaisedButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Изменить геоданные',
                    style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.bodyText1.fontFamily,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  onPressed: () async {
                    Navigator.pop(context, address);
                  },
                ),
                RaisedButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Все правильно',
                    style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.bodyText1.fontFamily,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  onPressed: () async {
                    Navigator.pop(context, address);
                  },
                ),
              ],
            ),
          ),
        );
      });
}
