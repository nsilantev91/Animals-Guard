import 'package:animals_guard/helpers/helpers.dart';
import 'package:flutter/material.dart';

class StepOneAbstractPlace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Helpers.responsiveWidth(24, context)
          ),
          child: Text(
            "Где вы увидели факт жестокого обращения с животными?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Helpers.responsiveHeight(16, context),
              color: Theme.of(context).textTheme.bodyText1.color,
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
            ),
          ),
        ),
        SizedBox(
          height: Helpers.responsiveHeight(80, context),
        ),
        GestureDetector(
          onTap: () {
            //TODO действия, если вживую
          },
          child: Container(
            alignment: Alignment.center,
            height: Helpers.responsiveHeight(48, context),
            width: Helpers.responsiveWidth(312, context),
            decoration: BoxDecoration(
              color: Theme.of(context).buttonColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              "Вживую",
              style: TextStyle(
                fontSize: Helpers.responsiveHeight(16, context),
                color: Theme.of(context).textTheme.bodyText1.color,
                fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(
          height: Helpers.responsiveHeight(24, context),
        ),
        GestureDetector(
          onTap: () {
            //TODO действия, если в интернете
          },
          child: Container(
            alignment: Alignment.center,
            height: Helpers.responsiveHeight(48, context),
            width: Helpers.responsiveWidth(312, context),
            decoration: BoxDecoration(
              color: Theme.of(context).buttonColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              "В интернете",
              style: TextStyle(
                fontSize: Helpers.responsiveHeight(16, context),
                color: Theme.of(context).textTheme.bodyText1.color,
                fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
