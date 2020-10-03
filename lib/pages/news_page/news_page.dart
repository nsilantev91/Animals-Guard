import 'package:animals_guard/helpers/helpers.dart';
import 'package:animals_guard/models/news_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  final NewsData data;

  NewsPage(this.data);

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Helpers.responsiveWidth(24, context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: EdgeInsets.only(
                    left: Helpers.responsiveWidth(6, context),
                  ),
                  margin: EdgeInsets.only(
                    top: Helpers.responsiveHeight(30, context),
                  ),
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
                    Icons.arrow_back_ios,
                    size: Helpers.responsiveHeight(16, context),
                  ),
                ),
              ),
              SizedBox(
                height: Helpers.responsiveHeight(24, context),
              ),
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
                  height: Helpers.responsiveHeight(220, context),
                  decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    image: DecorationImage(fit: BoxFit.cover, image: image),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(
                height: Helpers.responsiveHeight(24, context),
              ),
              Text(
                data.title,
                style: TextStyle(
                  fontSize: Helpers.responsiveHeight(28, context),
                  color: Theme.of(context).textTheme.bodyText1.color,
                  fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              getDate(context),
              SizedBox(
                height: Helpers.responsiveHeight(13, context),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    data.text,
                    style: TextStyle(
                      fontSize: Helpers.responsiveHeight(14, context),
                      color: Theme.of(context).textTheme.bodyText1.color,
                      fontFamily:
                          Theme.of(context).textTheme.bodyText1.fontFamily,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
