import 'dart:async';

import 'package:animals_guard/pages/profile_page/widgets/list_item.dart';
import 'package:flutter/material.dart';

class GeneralInfoTextField extends StatefulWidget {
  final double height;
  final double width;

  GeneralInfoTextField(this.height, this.width);

  double _adaptationHeight(double mySize) {
    return height * (mySize / 740);
  }

  double _adaptationWidth(double myWidth) {
    return width * (myWidth / 360);
  }

  @override
  _GeneralInfoTextFieldState createState() => _GeneralInfoTextFieldState();
}

enum UI_Command {
  focusSurname,
  focusName,
  focusPhone,
  focusEmail,
  unfocusPass,
  unfocusNum,
}

class _GeneralInfoTextFieldState extends State<GeneralInfoTextField> {
  var focusSurnameNode = FocusNode();
  var focusNameNode = FocusNode();
  var focusFathernameNode = FocusNode();
  var focusPhoneNode = FocusNode();
  var focusEmailNode = FocusNode();
  StreamSubscription listenUI;

  bool _isEmailValid;
  RegExp regExp = RegExp('\\w+@\\w+.\\w+');

  @override
  void dispose() {
    focusSurnameNode.dispose();
    focusNameNode.dispose();
    focusFathernameNode.dispose();
    focusPhoneNode.dispose();
    focusEmailNode.dispose();
    listenUI.cancel();
    super.dispose();
  }

  @override
  void initState() {
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
    return Column(
      children: <Widget>[
        Container(
          height: widget._adaptationHeight(52),
          width: widget._adaptationWidth(320),
          padding: EdgeInsets.only(left: widget._adaptationWidth(12)),
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
                  decoration: TextDecoration.none,
                  fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                  color: Theme.of(context).accentColor,
                  fontSize: 16,
                ),
                focusNode: focusSurnameNode,
                onFieldSubmitted: (_) {
                  focusNameNode.requestFocus();
                },
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
                  hintText: "Фамилия",
                ),
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                },
              ),
            ),
          ),
        ),
        SizedBox(
          height: widget._adaptationHeight(12),
        ),
        Container(
          height: widget._adaptationHeight(52),
          width: widget._adaptationWidth(320),
          padding: EdgeInsets.only(left: widget._adaptationWidth(12)),
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
                  decoration: TextDecoration.none,
                  fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                  color: Theme.of(context).accentColor,
                  fontSize: 16,
                ),
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.text,
                focusNode: focusNameNode,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  focusEmailNode.requestFocus();
                },
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
                  hintText: "Имя",
                ),
                onChanged: (value) {
                },
              ),
            ),
          ),
        ),
        SizedBox(
          height: widget._adaptationHeight(12),
        ),
        Container(
          height: widget._adaptationHeight(52),
          width: widget._adaptationWidth(320),
          padding: EdgeInsets.only(left: widget._adaptationWidth(12)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: _isEmailValid
                  ? Color(HexColor.getColorFromHex("#E2E2E2"))
                  : Theme.of(context).primaryColor,
              width: 1,
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Form(
              autovalidate: true,
              child: TextFormField(
                validator: (String v) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    bool cond = regExp.hasMatch(v) || v.trim().isEmpty;
                    if (!cond) {
                      if (_isEmailValid)
                        setState(() {
                          _isEmailValid = false;
                        });
                    } else if (!_isEmailValid)
                      setState(() {
                        _isEmailValid = true;
                      });
                  });
                },
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                  color: Theme.of(context).accentColor,
                  fontSize: 16,
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
                onChanged: (value) {
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
