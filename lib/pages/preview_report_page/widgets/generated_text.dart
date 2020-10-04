import 'package:animals_guard/helpers/helpers.dart';
import 'package:animals_guard/repos/statement_repos.dart';
import 'package:animals_guard/repos/user_repository.dart';
import 'package:flutter/material.dart';

class GeneratedText extends StatelessWidget {
  String text;
  GeneratedText(this.text);

  @override
  Widget build(BuildContext context) {
    var repos = StatementRepos.getInstance();
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Helpers.responsiveWidth(15, context),
        vertical: Helpers.responsiveHeight(8, context),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      width: Helpers.responsiveWidth(312, context),
      child: Column(
        children: [
          Text(
            "Сгенерированный текст",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              fontSize: Helpers.responsiveHeight(17, context),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: Helpers.responsiveHeight(12, context),
          ),
          Text(
            text,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              fontSize: Helpers.responsiveHeight(14, context),
            ),
          ),
        ],
      ),
    );
  }
}