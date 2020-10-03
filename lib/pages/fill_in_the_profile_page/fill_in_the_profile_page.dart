import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './widgets/general_info_text_field.dart';
import 'widgets/back_arrow.dart';
import 'widgets/birthday_picker.dart';
import 'widgets/choose_gender.dart';

class FillInTheProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    double _adaptationHeight(double mySize) {
      return height * (mySize / 740);
    }

    double _adaptationWidth(double myWidth) {
      return width * (myWidth / 360);
    }

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: _adaptationHeight(40),
                    left: _adaptationWidth(20),
                    right: _adaptationWidth(20),
                    top: _adaptationHeight(66)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BackArrow(
                        ),
                    SizedBox(
                      height: _adaptationHeight(15),
                    ),
                    SizedBox(
                      height: _adaptationHeight(11),
                    ),
                    Text(
                      "Введите свои персональные данные перед началом использования приложения.",
                      style: Theme.of(context).textTheme.body1,
                    ),
                    SizedBox(
                      height: _adaptationHeight(36),
                    ),
                    GeneralInfoTextField(height, width),
                    SizedBox(
                      height: _adaptationHeight(41),
                    ),
                    SizedBox(
                      height: _adaptationHeight(15),
                    ),
                    ChooseGender(),
                    SizedBox(
                      height: _adaptationHeight(15),
                    ),
                    BirthdayPicker(),
                  ],
                ),
              ),
            ),
            Positioned(
              width: width,
              top: height * 0.4,
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
