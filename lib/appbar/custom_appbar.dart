import 'package:animals_guard/helpers/helpers.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String text;
  CustomAppbar(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: Helpers.responsiveHeight(80, context),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Theme.of(context).textTheme.bodyText1.color,
          fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
          fontSize: Helpers.responsiveHeight(18, context)
        ),
      ),
    );
  }
}