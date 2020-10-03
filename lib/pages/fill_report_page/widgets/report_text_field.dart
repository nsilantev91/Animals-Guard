import 'package:animals_guard/helpers/helpers.dart';
import 'package:flutter/material.dart';

class ReportTextField extends StatelessWidget {
  final String label;

  ReportTextField(this.label);
  //TODO возможно, передать параметры сюда для отображения новых вопросов и ответов на них
  //TODO также, нужно сохранять значения предыдущих ответов на предыдущие вопросы соответственно, если пользователь нажмет назад
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Helpers.responsiveHeight(6, context),
        top: Helpers.responsiveHeight(6, context),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: Helpers.responsiveWidth(20, context),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor,
      ),
      width: Helpers.responsiveWidth(320, context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
          ),
          Container(
            padding: EdgeInsets.only(
              left: Helpers.responsiveWidth(10, context),
            ),
            width: Helpers.responsiveWidth(300, context),
            child: TextField(
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1.color,
                fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                fontSize: Helpers.responsiveHeight(17, context),
              ),
              cursorColor: Theme.of(context).textTheme.bodyText1.color,
              minLines: 1,
              maxLines: 10,
              decoration: InputDecoration(
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                hintText: "Введите сообщение...",
                hintStyle: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2.color,
                  fontFamily: Theme.of(context).textTheme.bodyText2.fontFamily,
                  fontSize: Helpers.responsiveHeight(15, context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}