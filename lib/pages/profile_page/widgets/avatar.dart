import 'dart:io';
import 'package:animals_guard/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Avatar extends StatefulWidget {
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (ctx) => Platform.isAndroid
                ? SimpleDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    contentPadding: EdgeInsets.only(
                        left: Helpers.responsiveWidth(20, context),
                        right: Helpers.responsiveWidth(20, context),
                        top: Helpers.responsiveWidth(24, context),
                        bottom: Helpers.responsiveWidth(24, context)),
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () async {
                            },
                            child: Container(
                              width: Helpers.responsiveWidth(300, context),
                              child: Text(
                                "Загрузить фотографию",
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 16,
                                  fontFamily: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .fontFamily,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.027,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () async {
                        },
                        child: Container(
                          width: Helpers.responsiveWidth(300, context),
                          child: Text(
                            "Сделать фото",
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 16,
                              fontFamily:
                                  Theme.of(context).textTheme.body1.fontFamily,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.027,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Container(
                          width: Helpers.responsiveWidth(300, context),
                          child: Text(
                            "Удалить фотографию",
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 16,
                              fontFamily:
                                  Theme.of(context).textTheme.body1.fontFamily,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Align(
                    alignment: Alignment.bottomCenter,
                    child: CupertinoActionSheet(
                        actions: [
                          CupertinoActionSheetAction(
                            child: const Text('Загрузить фотографию'),
                            onPressed: () async {
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: const Text('Сделать фото'),
                            onPressed: () async {
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: const Text('Удалить фото'),
                            onPressed: () {
                            },
                          ),
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          child: const Text('Отменить'),
                          isDefaultAction: true,
                          onPressed: () {
                            setState(() {});
                            Navigator.of(ctx).pop();
                          },
                        ))));
      },
      child: CircleAvatar(
        backgroundColor: Theme.of(context).accentColor,
        radius: height * 0.1,
      ),
    );
  }
}
