import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


Future<dynamic> messageHandler(Map<String, dynamic> message) async {

  throw new Exception();
}

class FCMNotifications {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  FlutterLocalNotificationsPlugin _fln = new FlutterLocalNotificationsPlugin();


  Future<void> onSelectNotification(String payload) async {
    print("____________LOCALNOTIFICATION__________________");
    print("payload is $payload");
  }

  void configLocalNotification() {
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    _fln.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future initialise() async {
    print('Initializing...');
    configLocalNotification();

    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    _launchHandler(Map<String, dynamic> message) async {
      print("onLaunch: $message");
      await Future.delayed(Duration(seconds: 2));
    }

    _resumeHandler(Map<String, dynamic> message) async {
      print("onResume: $message");
    }

    _messageHandler(Map<String, dynamic> message) async {
      print("\n\nonMessage: $message\n\n");
      var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        // Настройка параметров для ОС андроид
        Platform.isAndroid ? 'com.dfa.appnis' : 'com.duytq.appnis',
        'App_nis',
        'Notification chan',
        playSound: true,
        enableVibration: true,
        importance: Importance.High,
        priority: Priority.High,
      );
      var iOSPlatformChannelSpecifics =
          new IOSNotificationDetails(); // Настройка параметров для ИОС
      var platformChannelSpecifics = new NotificationDetails(
          androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
      var title = ' ';
      var body = ' ';
      if(Platform.isIOS)
      {
        
        title = message['aps']['alert']['title'];
        body = message['aps']['alert']['body'];
      }
      else {
        title = message["notification"]["title"];
        body = message["notification"]["body"];
      }
      _fln.show(1, title, body, platformChannelSpecifics, payload: "payload");
    }

    _fcm.configure(
      onMessage: _messageHandler,
      onLaunch: _launchHandler,
      onResume: _resumeHandler,
      onBackgroundMessage: Platform.isAndroid ? messageHandler : null,
    );
  }
}
