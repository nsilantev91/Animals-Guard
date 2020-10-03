import 'package:animals_guard/helpers/helpers.dart';
import 'package:animals_guard/pages/fill_report_page/widgets/report_text_field.dart';
import 'package:flutter/material.dart';

class StepFourMapPlace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Helpers.responsiveWidth(24, context)
          ),
          child: Text(
            "Укажите адрес произошедшего",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Helpers.responsiveHeight(16, context),
              color: Theme.of(context).textTheme.bodyText1.color,
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
            ),
          ),
        ),
        SizedBox(
          height: Helpers.responsiveHeight(100, context),
        ),
        ReportTextField("Адрес:"),
      ],
    );
  }
}