import 'package:animals_guard/helpers/helpers.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function function;
  const AuthButton({
    this.text,
    this.color,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        height: Helpers.responsiveHeight(48, context),
        width: Helpers.responsiveWidth(150, context),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: Helpers.responsiveHeight(13, context),
            color: Theme.of(context).textTheme.bodyText1.color,
            fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
          ),
        ),
      ),
    );
  }
}
