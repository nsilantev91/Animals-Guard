import 'package:animals_guard/helpers/helpers.dart';
import 'package:animals_guard/models/news_data.dart';
import 'package:animals_guard/pages/navigation_page.dart';
import 'package:animals_guard/pages/news_page/news_page.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsItem extends StatelessWidget {
  final NewsData data;

  NewsItem(this.data);

  Widget getDate(BuildContext context) {
    var month = data.date.month < 10
        ? "0" + data.date.month.toString()
        : data.date.month.toString();
    var minute = data.date.minute < 10
        ? "0" + data.date.minute.toString()
        : data.date.minute.toString();
    var day = data.date.day < 10
        ? "0" + data.date.day.toString()
        : data.date.day.toString();
    var hour = data.date.hour < 10
        ? "0" + data.date.hour.toString()
        : data.date.hour.toString();
    String days = day + "." + month + "." + data.date.year.toString() + ", ";
    String time = hour + ":" + minute;
    return Text(
      days + time,
      style: TextStyle(
        fontSize: Helpers.responsiveHeight(12, context),
        color: Theme.of(context).textTheme.bodyText2.color,
        fontFamily: Theme.of(context).textTheme.bodyText2.fontFamily,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  String getTextPreview() {
    return data.text.length > 42
        ? data.text.substring(0, 39) + "..."
        : data.text;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => NewsPage(data),
          ),
        );
      },
      child: Container(
        child: Column(
          children: [
            //заглушка для картинки
            CachedNetworkImage(
                imageUrl: data.pictureUrl,
                placeholder: (context, _) => Container(
                      height: Helpers.responsiveHeight(220, context),
                      decoration: BoxDecoration(
                        color: Theme.of(context).buttonColor,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/dog-placeholder.png')),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                imageBuilder: (_, image) => Container(
                      height: Helpers.responsiveHeight(200, context),
                      decoration: BoxDecoration(
                        color: Theme.of(context).buttonColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        image: DecorationImage(fit: BoxFit.cover, image: image),
                      ),
                    )),
            Container(
              width: Helpers.responsiveWidth(312, context),
              padding: EdgeInsets.only(
                top: Helpers.responsiveHeight(8, context),
                left: Helpers.responsiveWidth(17, context),
                bottom: Helpers.responsiveHeight(8, context),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getDate(context),
                  SizedBox(
                    height: Helpers.responsiveHeight(3, context),
                  ),
                  Text(
                    data.title,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color,
                      fontFamily:
                          Theme.of(context).textTheme.bodyText1.fontFamily,
                      fontSize: Helpers.responsiveHeight(14, context),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: Helpers.responsiveHeight(3, context),
                  ),
                  Text(
                    getTextPreview(),
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color,
                      fontFamily:
                          Theme.of(context).textTheme.bodyText1.fontFamily,
                      fontSize: Helpers.responsiveHeight(12, context),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
