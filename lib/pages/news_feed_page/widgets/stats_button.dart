import 'package:animals_guard/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class StatsButton extends StatelessWidget {
  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            backgroundColor: Theme.of(context).cardColor,
            contentPadding: EdgeInsets.all(0),
            titlePadding: EdgeInsets.all(0),
            content: Container(
              width: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: Helpers.responsiveHeight(5, context),
                      bottom: Helpers.responsiveHeight(28, context),
                    ),
                    child: Text(
                      'Всплывающее окно с диаграммой, которую проще всего реализовать',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: Helpers.responsiveHeight(18, context),
                          ),
                    ),
                  ),
                  PieChart(
                    dataMap: dataMap,
                    animationDuration: Duration(milliseconds: 800),
                    chartLegendSpacing: 32,
                    chartRadius: MediaQuery.of(context).size.width / 3.2,
                    initialAngleInDegree: 0,
                    chartType: ChartType.disc,
                    ringStrokeWidth: 32,
                    legendOptions: LegendOptions(
                      showLegends: false,
                    ),
                    chartValuesOptions: ChartValuesOptions(
                      showChartValueBackground: false,
                      showChartValues: false,
                      showChartValuesInPercentage: false,
                      showChartValuesOutside: false,
                    ),
                  ),
                ],
              ),
            ),
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
              horizontal: Helpers.responsiveWidth(25, context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.pie_chart,
                size: Helpers.responsiveHeight(26, context),
              ),
              Text(
                "Статистика обращений",
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1.color,
                  fontWeight: FontWeight.w500,
                  fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                  fontSize: Helpers.responsiveHeight(18, context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
