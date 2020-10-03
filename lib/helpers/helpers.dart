import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'global.dart';

class Helpers {
  static double responsiveHeight(double size, BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return height * (size / 740);
  }

  static double responsiveWidth(double size, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return width * (size / 360);
  }

  static void showWarningDialog(String title, String body) {
    showDialog<void>(
      context: myGlobals.globalKey.currentContext,
      builder: (BuildContext context) {
        return Platform.isAndroid
            ? AlertDialog(
                title: Text(title),
                content: Text(
                  body,
                  style: Theme.of(context).textTheme.body1,
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      'Ок',
                      style: TextStyle(
                        fontFamily:
                            Theme.of(context).textTheme.body2.fontFamily,
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            : CupertinoAlertDialog(
                title: Text(title),
                content: Text(
                  body,
                  style: Theme.of(context).textTheme.body1,
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      'Ок',
                      style: TextStyle(
                        fontFamily:
                            Theme.of(context).textTheme.body2.fontFamily,
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
      },
    );
  }
}
