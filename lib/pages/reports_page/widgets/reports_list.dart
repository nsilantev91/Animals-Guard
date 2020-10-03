import 'package:animals_guard/helpers/helpers.dart';
import 'package:animals_guard/pages/reports_page/widgets/report_item.dart';
import 'package:flutter/material.dart';

class ReportsList extends StatelessWidget {
  //TODO создать модель, поменять список виджетов на список моделей, замэпить его в reportitem в listview
  final List<ReportItem> _reportsList = [
    ReportItem(),
    ReportItem(),
    ReportItem(),
  ].reversed.toList();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Helpers.responsiveHeight(500, context),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: Helpers.responsiveWidth(24, context)
        ),
        itemBuilder: (_, index) => _reportsList[index],
        separatorBuilder: (_, __) => SizedBox(
          height: Helpers.responsiveHeight(24, context),
        ),
        itemCount: _reportsList.length,
      ),
    );
  }
}
