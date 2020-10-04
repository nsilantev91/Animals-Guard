import 'dart:async';

import 'package:animals_guard/helpers/helpers.dart';
import 'package:animals_guard/pages/profile_page/widgets/list_item.dart';
import 'package:animals_guard/repos/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class GeneralInfoTextField extends StatefulWidget {
  @override
  _GeneralInfoTextFieldState createState() => _GeneralInfoTextFieldState();
}

class _GeneralInfoTextFieldState extends State<GeneralInfoTextField> {
  var focusSurnameNode = FocusNode();
  var focusNameNode = FocusNode();
  var focusFathernameNode = FocusNode();
  var focusEmailNode = FocusNode();
  var focusPhoneNode = FocusNode();



  RegExp regExp = RegExp('\\w+@\\w+.\\w+');

  @override
  void dispose() {
    focusSurnameNode.dispose();
    focusNameNode.dispose();
    focusFathernameNode.dispose();
    focusEmailNode.dispose();
    focusPhoneNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final repos = UserRepos.getInstance();
    // ignore: close_sinks
    var threeSample = Text(
      "###",
      style: TextStyle(
        decoration: TextDecoration.underline,
      ),
    );
    var fourSample = Text(
      "####",
      style: TextStyle(
        decoration: TextDecoration.underline,
      ),
    );
    var maskPhone = MaskTextInputFormatter(
        mask: "+#(${threeSample.data}) ${threeSample.data}-${fourSample.data}");
    return Column(
      children: <Widget>[
        Container(
          height: Helpers.responsiveHeight(52, context),
          width: Helpers.responsiveWidth(320, context),
          padding: EdgeInsets.only(
            left: Helpers.responsiveWidth(12, context),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: Color(HexColor.getColorFromHex("#E2E2E2")),
              width: 1,
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Form(
              child: TextFormField(
                initialValue: repos.surname,
                style: TextStyle(
                  fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                  color: Theme.of(context).textTheme.bodyText1.color,
                ),
                focusNode: focusSurnameNode,
                onFieldSubmitted: (_) {
                  focusNameNode.requestFocus();
                },
                cursorColor: Theme.of(context).textTheme.bodyText1.color,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Color(HexColor.getColorFromHex("#CDCACA")),
                    fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  hintText: "Фамилия",
                ),
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  repos.setSurname(value);
                },
              ),
            ),
          ),
        ),
        SizedBox(
          height: Helpers.responsiveHeight(12, context),
        ),
        Container(
          height: Helpers.responsiveHeight(52, context),
          width: Helpers.responsiveWidth(320, context),
          padding: EdgeInsets.only(
            left: Helpers.responsiveWidth(12, context),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: Color(HexColor.getColorFromHex("#E2E2E2")),
              width: 1,
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Form(
              child: TextFormField(
                style: TextStyle(
                  fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                  color: Theme.of(context).textTheme.bodyText1.color,
                ),
                initialValue: repos.name,
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.text,
                focusNode: focusNameNode,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  focusFathernameNode.requestFocus();
                },
                cursorColor: Theme.of(context).textTheme.bodyText1.color,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Color(HexColor.getColorFromHex("#CDCACA")),
                    fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  hintText: "Имя",
                ),
                onChanged: (value) {
                  repos.setName(value);
                },
              ),
            ),
          ),
        ),
        SizedBox(
          height: Helpers.responsiveHeight(12, context),
        ),
        Container(
          height: Helpers.responsiveHeight(52, context),
          width: Helpers.responsiveWidth(320, context),
          padding: EdgeInsets.only(
            left: Helpers.responsiveWidth(12, context),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: Color(HexColor.getColorFromHex("#E2E2E2")),
              width: 1,
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Form(
              child: TextFormField(
                textInputAction: TextInputAction.next,
                initialValue: repos.secondName,
                style: TextStyle(
                  fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                  color: Theme.of(context).textTheme.bodyText1.color,
                ),
                focusNode: focusFathernameNode,
                cursorColor: Theme.of(context).textTheme.bodyText1.color,
                onFieldSubmitted: (_) {
                  focusEmailNode.requestFocus();
                },
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Color(HexColor.getColorFromHex("#CDCACA")),
                    fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  hintText: "Отчество",
                ),
                textCapitalization: TextCapitalization.sentences,
                onChanged: (value) {
                  repos.setSecondName(value);
                },
              ),
            ),
          ),
        ),
        SizedBox(
          height: Helpers.responsiveHeight(12, context),
        ),
        Container(
          height: Helpers.responsiveHeight(52, context),
          width: Helpers.responsiveWidth(320, context),
          padding: EdgeInsets.only(
            left: Helpers.responsiveWidth(12, context),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: Color(HexColor.getColorFromHex("#E2E2E2")),
              width: 1,
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Form(
              autovalidate: true,
              child: TextFormField(
                initialValue: repos.email,
                style: TextStyle(
                  fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                  color: Theme.of(context).textTheme.bodyText1.color,
                ),
                textInputAction: TextInputAction.next,
                focusNode: focusEmailNode,
                cursorColor: Theme.of(context).accentColor,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Color(HexColor.getColorFromHex("#CDCACA")),
                    fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  hintText: "E-mail",
                ),
                onFieldSubmitted: (_) {
                  focusPhoneNode.requestFocus();
                },
                onChanged: (value) {
                  repos.setEmail(value);
                },
                keyboardType: TextInputType.emailAddress,
              ),
            ),
          ),
        ),
        SizedBox(
          height: Helpers.responsiveHeight(12, context),
        ),
        Container(
          height: Helpers.responsiveHeight(52, context),
          width: Helpers.responsiveWidth(320, context),
          padding: EdgeInsets.only(
            left: Helpers.responsiveWidth(12, context),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: Color(HexColor.getColorFromHex("#E2E2E2")),
              width: 1,
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Form(
              autovalidate: true,
              child: TextFormField(
                initialValue: repos.phoneNumber,
                style: TextStyle(
                  fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                  color: Theme.of(context).textTheme.bodyText1.color,
                ),
                textInputAction: TextInputAction.go,
                focusNode: focusPhoneNode,
                cursorColor: Theme.of(context).textTheme.bodyText1.color,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Color(HexColor.getColorFromHex("#CDCACA")),
                    fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  hintText: "Номер телефона",
                ),
                onFieldSubmitted: (_) {},
                onChanged: (value) {
                  repos.setPhomeNumber(value);
                },
                keyboardType: TextInputType.emailAddress,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
