import 'dart:io';

import 'package:animals_guard/helpers/helpers.dart';
import 'package:animals_guard/pages/fill_in_the_profile_page/fill_in_the_profile_page.dart';
import 'package:animals_guard/repos/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './list_item.dart';

class StructuredInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final repos = UserRepos.getInstance();
    // ignore: close_sinks
    //final userData = MyApp.userBloc;
    // ignore: close_sinks
    //final auth = MyApp.authBloc;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: Helpers.responsiveWidth(5, context)),
          child: Align(
            alignment: Alignment.topLeft,
            child: ListTile(
              title: Text(
                "Основные данные",
                style: TextStyle(
                  fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                  
                  color: Theme.of(context).textTheme.bodyText1.color,
                ),
              ),
              trailing: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => FillInTheProfilePage(),
                    ),
                  );
                },
                child: Icon(Icons.edit),
              ),
            ),
          ),
        ),
        SizedBox(
          height: Helpers.responsiveHeight(12, context),
        ),
        ListItem(
          "Фамилия",
          repos.surname,
        ),
        ListItem(
          "Имя",
          repos.name,
        ),
        ListItem(
          "Отчество",
          repos.secondName,
        ),
        ListItem(
          "Телефон",
          repos.phoneNumber,
        ),
        ListItem(
          "E-mail",
          repos.email,
          // MyApp.user.email,
        ),
        // ListItem(
        //     "Дата рождения",
        //     '',
        //     // MyApp.user.birthday == null
        //     //     ? ''
        //     //     : formatDate(MyApp.user.birthday, [dd, '/', mm, '/', yyyy]),
        //     height,
        //     width),
        SizedBox(
          height: Helpers.responsiveHeight(10, context),
        ),
      ],
    );
  }
}
