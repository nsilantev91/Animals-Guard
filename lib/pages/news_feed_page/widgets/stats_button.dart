import 'package:animals_guard/helpers/helpers.dart';
import 'package:animals_guard/pages/news_feed_page/widgets/map_for_stats.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class StatsButton extends StatelessWidget {
  Map<String, double> dataMap = {
    "В рассмотрении": 3,
    "Отказано": 2,
    "Одобрено": 2,
  };
  List<Color> _colors = [
    Colors.yellow,
    Colors.red,
    Colors.green,
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // showDialog(
        //   context: context,
        //   builder: (_) => AlertDialog(
        //     backgroundColor: Theme.of(context).cardColor,
        //     contentPadding: EdgeInsets.all(10),
        //     titlePadding: EdgeInsets.all(0),
        //     content: Container(
        //       width: 1,
        //       child: Column(
        //         mainAxisSize: MainAxisSize.min,
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Container(
        //             margin: EdgeInsets.only(
        //               top: Helpers.responsiveHeight(10, context),
        //               bottom: Helpers.responsiveHeight(10, context),
        //             ),
        //             child: Text(
        //               'Ваш регион: Ростовская область',
        //               textAlign: TextAlign.center,
        //               style: Theme.of(context).textTheme.bodyText1.copyWith(
        //                     fontSize: Helpers.responsiveHeight(18, context),
        //                     fontWeight: FontWeight.bold,
        //                   ),
        //             ),
        //           ),
        //           Container(
        //             margin: EdgeInsets.only(
        //               top: Helpers.responsiveHeight(15, context),
        //               bottom: Helpers.responsiveHeight(10, context),
        //             ),
        //             child: Text(
        //               'Статистика по поданным заявлениям',
        //               textAlign: TextAlign.center,
        //               style: Theme.of(context).textTheme.bodyText1.copyWith(
        //                     fontSize: Helpers.responsiveHeight(18, context),
        //                   ),
        //             ),
        //           ),
        //           PieChart(
        //             dataMap: dataMap,
        //             animationDuration: Duration(milliseconds: 800),
        //             chartLegendSpacing: 32,
        //             chartRadius: MediaQuery.of(context).size.width / 3.2,
        //             initialAngleInDegree: 0,
        //             chartType: ChartType.disc,
        //             ringStrokeWidth: 32,
        //             legendOptions: LegendOptions(
        //               showLegendsInRow: true,
        //               legendPosition: LegendPosition.bottom,
        //               showLegends: true,
        //               legendShape: BoxShape.circle,
        //               legendTextStyle: TextStyle(
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //             chartValuesOptions: ChartValuesOptions(
        //               showChartValueBackground: false,
        //               showChartValues: false,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // );

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MapForStats()));
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
