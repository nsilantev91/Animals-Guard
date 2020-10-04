import 'package:animals_guard/helpers/helpers.dart';
import 'package:flutter/material.dart';

class Achievements extends StatelessWidget {
  double progress = 0;
  int reportCount = 2;
  int repostCount = 5;

  Widget getUserTitleAchievement(BuildContext context){
    String title;
    if (progress < 0.30){
      title = "Спасибо, что вы с нами!";
    }
    else if (progress < 0.65){
      title = "Вы активный участник!";
    }
    else {
      title = "Вы настоящий друг и защитник животных!";
    }
    return Text(
      title,
      style: TextStyle(
        fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
        color: Theme.of(context).textTheme.bodyText1.color,
        fontSize: Helpers.responsiveHeight(14, context),
        fontWeight: FontWeight.w600,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    progress = reportCount * 0.21 + repostCount * 0.07;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ваш вклад в защиту животных: ',
          style: TextStyle(
            fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
            fontSize: Helpers.responsiveHeight(16, context),
            color: Theme.of(context).textTheme.bodyText1.color,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: Helpers.responsiveHeight(24, context),
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: Helpers.responsiveWidth(312, context),
          height: Helpers.responsiveHeight(30, context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: FractionallySizedBox(
            widthFactor: progress < 1 ? progress : 1.0,
            child: Container(
              alignment: Alignment.center,
              width: Helpers.responsiveWidth(312, context),
              height: Helpers.responsiveHeight(30, context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).buttonColor,
                    Color(0xFFC5E2FF),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: Helpers.responsiveHeight(12, context),
        ),
        getUserTitleAchievement(context),
        SizedBox(
          height: Helpers.responsiveHeight(24, context),
        ),
        Text(
          "Подано заявлений: " + reportCount.toString(),
          style: TextStyle(
            fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
            fontSize: Helpers.responsiveHeight(13, context),
            color: Theme.of(context).textTheme.bodyText1.color,
          ),
        ),
        SizedBox(
          height: Helpers.responsiveHeight(5, context),
        ),
        Text(
          "Сделано репостов: " + repostCount.toString(),
          style: TextStyle(
            fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
            fontSize: Helpers.responsiveHeight(13, context),
            color: Theme.of(context).textTheme.bodyText1.color,
          ),
        ),
      ],
    );
  }
}
