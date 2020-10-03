import 'package:animals_guard/helpers/helpers.dart';
import 'package:animals_guard/pages/news_feed_page/widgets/news_list.dart';
import 'package:animals_guard/pages/news_feed_page/widgets/stats_button.dart';
import 'package:flutter/material.dart';

class NewsFeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StatsButton(),
        SizedBox(
          height: Helpers.responsiveHeight(20, context),
        ),
        NewsList(),
      ],
    );
  }
}
