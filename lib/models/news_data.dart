import 'package:flutter/material.dart';

class NewsData {
  final String title;
  final DateTime date;
  final String text;
  final String pictureUrl;
  final int id;
  NewsData({
    @required this.title,
    @required this.date,
    @required this.text,
    @required this.pictureUrl,
    @required this.id
  });

  factory NewsData.empty() => new NewsData(
      id: 0, title: '', text: '', pictureUrl: '', date: null);

  factory NewsData.fromMap(Map<String, dynamic> m) => new NewsData(
        id: m['id'],
        pictureUrl: m['picture'],
        date: DateTime.parse(m['created_at']),
        text: m['body'],
        title: m['title'],
      );
}