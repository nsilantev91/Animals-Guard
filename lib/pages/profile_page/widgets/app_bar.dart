import 'package:animals_guard/helpers/helpers.dart';
import 'package:flutter/material.dart';

Widget getAppBar(BuildContext context, String title) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      onPressed: () {
      },
      icon: Icon(
        Icons.message,
        color: Colors.black,
      ),
    ),
    actions: [],
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: Helpers.responsiveWidth(14, context),
      ),
    ),
  );
}
