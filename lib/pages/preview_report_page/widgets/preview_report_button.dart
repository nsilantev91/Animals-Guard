import 'package:animals_guard/helpers/helpers.dart';
import 'package:flutter/material.dart';

class PreviewReportButton extends StatelessWidget {
  final Function action;
  final Color color;
  final String text;

  const PreviewReportButton({Key key, this.action, this.color, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        alignment: Alignment.center,
        height: Helpers.responsiveHeight(48, context),
        width: Helpers.responsiveWidth(312, context),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: Helpers.responsiveHeight(16, context),
            color: Theme.of(context).textTheme.bodyText1.color,
            fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
          ),
        ),
      ),
    );
  }
}
