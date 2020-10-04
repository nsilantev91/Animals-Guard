import 'dart:async';
import 'dart:io';

import 'package:animals_guard/bloc/news_bloc/news_bloc.dart';
import 'package:animals_guard/helpers/helpers.dart';
import 'package:animals_guard/repos/user_repository.dart';
import 'package:animals_guard/models/news_data.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

class Requests {
  static FirebaseMessaging fbm = FirebaseMessaging();

  static void handleTimeOutException() {
    // Helpers.showWarningDialog('Ошибка получения данных',
    //     'Время на загрузку истекло. Повторите попытку.');
  }

  static void handleLostConnection() {
    // Helpers.showWarningDialog(
    //   'Ошибка получения данных',
    //   'Соединение с сервером потеряно. Проверьте Интернет-соединение и обновите данные.',
    // );
  }

  static const IP = '178.154.255.209:3009';
  static const URL = 'http://$IP';
  // ignore: non_constant_identifier_names
  static String Gtoken;

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
    UserRepos.news = [];
    var items = body as List<dynamic>;
    items.forEach((element) {
      var newsContent = NewsData.fromMap(element);
      UserRepos.news.add(newsContent);
    });
    UserRepos.news.sort((el1, el2) => el2.date.compareTo(el1.date));
    //NewsBloc()..add(FinishLoading());
  }

  ///авторизация пользователя по номеру телефона и паролю
  static Future logIn(
      {@required String phoneNumber, @required String password}) async {
    String body = jsonEncode(<String, dynamic>{
      "auth": {"phone_number": phoneNumber, "password": password}
    });

    final response = await http
        .post(URL + '/user_token',
            body: body,
            headers: <String, String>{'Content-Type': 'application/json'})
        .timeout(Duration(seconds: 10))
        .catchError((_) => handleTimeOutException(),
            test: (e) => e is TimeoutException)
        .catchError((_) {
          handleLostConnection();
        });
    if (response != null) {
      if (response.statusCode != 201) {
        //ошибка
        Helpers.showWarningDialog(
            "Ошибка авторизации", 'Неверный логин или пароль');
      } else {
        Requests.Gtoken = json.decode(response.body)['jwt'];
      }
    }
  }

  //получение данных профиля
  static Future getProfile() async {
    final response = await http
        .get(URL + '/user', headers: {HttpHeaders.authorizationHeader: Gtoken})
        .timeout(Duration(seconds: 10))
        .catchError((_) => handleTimeOutException(),
            test: (e) => e is TimeoutException)
        .catchError((_) {
          handleLostConnection();
        });
    if (response.statusCode != 200) {
      //ошибка
      if (response.statusCode == 500) {
        //переполучить token
      } else {
        //ошибка загрузки
        Helpers.showWarningDialog('Внимание', 'Ошибка получения данных');
      }
    } else //все верно
    {
      //TODO
    }
  }

  ///отправить данные профиля
  static Future<http.Response> sentProfile() async {
    String body = jsonEncode(<String, dynamic>{
      "user": "TODO",
    });

    final response = await http
        .put(URL + '/user', body: body, headers: {
          HttpHeaders.authorizationHeader: Gtoken,
          'Content-Type': 'application/json'
        })
        .timeout(Duration(seconds: 10))
        .catchError((_) => handleTimeOutException(),
            test: (e) => e is TimeoutException)
        .catchError((_) {
          handleLostConnection();
        });

    if (response.statusCode != 200) {
      //ошибка
      if (response.statusCode == 500) {
        //переполучить token
      } else {
        //ошибка загрузки
        Helpers.showWarningDialog('Внимание', 'Ошибка отправки данных');
      }
    } else //все верно
    {}
  }
}

class RequestErrorExeption implements Exception {
  final String message;

  const RequestErrorExeption({@required this.message});
}
