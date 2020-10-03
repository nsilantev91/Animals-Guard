import 'package:animals_guard/appbar/custom_appbar.dart';
import 'package:animals_guard/helpers/helpers.dart';
import 'package:animals_guard/pages/fill_report_page/fill_report_page.dart';
import 'package:animals_guard/pages/reports_page/widgets/reports_list.dart';
import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              alignment: Alignment.centerRight,
              children: [
                CustomAppbar("Мои заявления"),
                Positioned(
                  right: Helpers.responsiveWidth(20, context),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: Helpers.responsiveHeight(40, context),
                      width: Helpers.responsiveHeight(40, context),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 0.5,
                          color: Color(0xFFD3DADD),
                        ),
                      ),
                      child: Icon(
                        Icons.close,
                        size: Helpers.responsiveHeight(20, context),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: Helpers.responsiveHeight(24, context),
            ),
            ReportsList(),
            SizedBox(
              height: Helpers.responsiveHeight(24, context),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => FillReportPage(),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                height: Helpers.responsiveHeight(48, context),
                width: Helpers.responsiveWidth(312, context),
                decoration: BoxDecoration(
                  color: Theme.of(context).buttonColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Helpers.responsiveWidth(25, context),
                  ),
                  child: Text(
                    "Добавить заявление",
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color,
                      fontWeight: FontWeight.w500,
                      fontFamily:
                          Theme.of(context).textTheme.bodyText1.fontFamily,
                      fontSize: Helpers.responsiveHeight(18, context),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
