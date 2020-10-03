import 'package:animals_guard/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class StepThreeTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Helpers.responsiveWidth(24, context),
          ),
          child: Text(
            "Когда это произошло",
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
        GestureDetector(
          onTap: () {
            //TODO выбрать время
            DatePicker.showDateTimePicker(
              context,
              currentTime: DateTime.now(),
            );
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
              "Выбрать время",
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
