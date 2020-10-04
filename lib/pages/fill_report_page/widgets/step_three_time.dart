import 'package:animals_guard/helpers/helpers.dart';
import 'package:animals_guard/repos/statement_repos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class StepThreeTime extends StatefulWidget {
  @override
  _StepThreeTimeState createState() => _StepThreeTimeState();
}

class _StepThreeTimeState extends State<StepThreeTime> {
  DateTime _dateTime;
  @override
  void initState() {
    _dateTime = DateTime.now();
    StatementRepos.getInstance().setIncidentTime(_dateTime);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
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
            height: Helpers.responsiveHeight(60, context),
          ),
          Text(
            '${_dateTime.day}.${_dateTime.month}.${_dateTime.year}  ${_dateTime.hour}:${_dateTime.minute}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: Helpers.responsiveHeight(40, context),
          ),
          GestureDetector(
            onTap: () {
              //TODO выбрать время
              DatePicker.showDateTimePicker(
                context,
                locale: LocaleType.ru,
                currentTime: DateTime.now(),
              ).then((value) {
                if (value != null) {
                  StatementRepos.getInstance().setIncidentTime(value);
                  setState(() {
                    _dateTime = value;
                  });
                }
              });
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
