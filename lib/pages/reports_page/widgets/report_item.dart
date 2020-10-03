import 'package:animals_guard/helpers/helpers.dart';
import 'package:flutter/material.dart';

class ReportItem extends StatelessWidget {
  //TODO передать сюда данные от заявления, делаю везде заглушки
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Helpers.responsiveWidth(13, context),
        right: Helpers.responsiveWidth(13, context),
        top: Helpers.responsiveHeight(15, context),
      ),
      height: Helpers.responsiveHeight(110, context),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Заявление от 01/01/1970",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              fontSize: Helpers.responsiveHeight(16, context),
            ),
          ),
          SizedBox(
            height: Helpers.responsiveHeight(6, context),
          ),
          Text(
            "Начало текста заявления, здесь будет пара строк",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              fontSize: Helpers.responsiveHeight(14, context),
            ),
          ),
           SizedBox(
            height: Helpers.responsiveHeight(7, context),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Рассматривается",
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText2.color,
                fontFamily: Theme.of(context).textTheme.bodyText2.fontFamily,
                fontSize: Helpers.responsiveHeight(10, context),
              ),
            ),
          )
        ],
      ),
    );
  }
}
