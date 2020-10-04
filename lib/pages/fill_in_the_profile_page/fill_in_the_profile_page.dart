import 'dart:io';
import 'package:animals_guard/bloc/user_bloc/user_bloc.dart';
import 'package:animals_guard/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../main.dart';
import './widgets/general_info_text_field.dart';
import 'widgets/back_arrow.dart';

class FillInTheProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            MyApp.userBloc.add(GetLocalProfile());
            return true;
          },
          child: Scaffold(
            body: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: Helpers.responsiveHeight(40, context),
                      left: Helpers.responsiveWidth(20, context),
                      right: Helpers.responsiveWidth(20, context),
                      top: Helpers.responsiveHeight(66, context),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        BackArrow(
                          onBack: () => MyApp.userBloc.add(GetLocalProfile()),
                        ),
                        SizedBox(
                          height: Helpers.responsiveHeight(15, context),
                        ),
                        SizedBox(
                          height: Helpers.responsiveHeight(11, context),
                        ),
                        Text(
                          "Введите свои персональные данные перед началом использования приложения.",
                          style: TextStyle(
                            fontFamily: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .fontFamily,
                            color: Theme.of(context).textTheme.bodyText1.color,
                          ),
                        ),
                        SizedBox(
                          height: Helpers.responsiveHeight(36, context),
                        ),
                        GeneralInfoTextField(),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  //колёсико ожидания

                  child: Container(),
                  // child: BlocBuilder<UserBloc, UserState>(
                  //   builder: (context, state) {
                  //     if (state is LoadingUserData)
                  //       return Platform.isAndroid
                  //           ? Center(child: CircularProgressIndicator())
                  //           : Center(child: CupertinoActivityIndicator());
                  //     else
                  //       return Container();
                  //   },
                  // ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
