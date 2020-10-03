import 'package:animals_guard/helpers/helpers.dart';
import 'package:flutter/material.dart';

class StepFiveAttachments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Helpers.responsiveWidth(24, context)
          ),
          child: Text(
            "Прикрепите файлы",
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
        //TODO здесь будет отображаться список прикрепленных файлов
        //TODO добавленный виджет - ReportTextField с текстом названия файла, label - тип файла
        RaisedButton.icon(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color(0xFFD3DADD),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          onPressed: () {
            //TODO добавить файл
          },
          icon: Icon(
            Icons.add,
            color: Color(0xFFD3DADD),
          ),
          label: Text(
            "Добавить файл",
            style: TextStyle(
              color: Color(0xFFD3DADD),
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              fontSize: Helpers.responsiveHeight(17, context),
            ),
          ),
        )
      ],
    );
  }
}
