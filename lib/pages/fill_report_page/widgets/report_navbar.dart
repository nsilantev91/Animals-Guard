import 'package:animals_guard/helpers/helpers.dart';
import 'package:flutter/material.dart';

class ReportNavbar extends StatelessWidget {
  final int currentStep;
  final Function incStep;
  final Function decStep;

  ReportNavbar({this.currentStep, this.decStep, this.incStep});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Helpers.responsiveHeight(88, context),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 40,
            color: Color.fromRGBO(163, 174, 179, 0.25),
          )
        ],
      ),
      padding: EdgeInsets.only(
        left: Helpers.responsiveWidth(25, context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IgnorePointer(
            ignoring: false,
            child: GestureDetector(
              onTap: decStep,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: currentStep == 1 ? 0.0 : 1.0,
                child: Container(
                  padding: EdgeInsets.only(
                    left: Helpers.responsiveWidth(9, context),
                  ),
                  height: Helpers.responsiveHeight(52, context),
                  width: Helpers.responsiveHeight(52, context),
                  decoration: BoxDecoration(
                    color: Color(0xFF98D2F5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: Helpers.responsiveHeight(19, context),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: Helpers.responsiveWidth(5, context),
          ),
          IgnorePointer(
            ignoring: false,
            child: GestureDetector(
              onTap: incStep,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: currentStep == 0 ? 0.0 : 1.0,
                child: Container(
                  alignment: Alignment.center,
                  width: Helpers.responsiveWidth(212, context),
                  height: Helpers.responsiveWidth(52, context),
                  decoration: BoxDecoration(
                    color: Color(0xffFFEE94),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Далее",
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color,
                      fontFamily:
                          Theme.of(context).textTheme.bodyText1.fontFamily,
                      fontSize: Helpers.responsiveHeight(18, context),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
