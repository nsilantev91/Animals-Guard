import 'package:animals_guard/helpers/user_repository.dart';
import 'package:animals_guard/models/news_data.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

class Requests {
  static FirebaseMessaging fbm = FirebaseMessaging();

  static const IP = '178.154.255.209:3009';
  static const URL = 'http://$IP';

  ///Устанавливает пуш-токен
  static Future<bool> setTempPushToken() async {
    print('set');
    String token = await fbm.getToken();
    http.Response response = await http.post(URL + "/temp_users",
        headers: {
          'Accept': '*/*',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'push_token': (token ?? "0"),
        }));
    if (response.statusCode == 201 || response.statusCode == 208) {
      return true;
    } else {
      throw new RequestErrorExeption(
          message: "Ошибка во время выполнения запроса.");
    }
  }

  static Future<void> getNews() async {
    http.Response response = await http.get(URL + '/posts');
    var body = jsonDecode(response.body);
    UserRepository.news = [];
    var items = body as List<dynamic>;
    items.forEach((element) {
      var newsContent = NewsData.fromMap(element);
      UserRepository.news.add(newsContent);
    });
    UserRepository.news.sort((el1, el2) => el2.date.compareTo(el1.date));
    //NewsBloc()..add(FinishLoading());
  }
}

class RequestErrorExeption implements Exception {
  final String message;

  const RequestErrorExeption({@required this.message});
}
