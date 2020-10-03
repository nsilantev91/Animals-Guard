import 'package:flutter/cupertino.dart';
import 'notifications.dart';


// пуш-уведомления
var notifications = new FCMNotifications();

// глобальный контекст
MyGlobals myGlobals = new MyGlobals();

class MyGlobals {
  GlobalKey _scaffoldAuthKey;
  GlobalKey _scaffoldProfileKey;
  bool auth = true;
  MyGlobals() {
    _scaffoldAuthKey = GlobalKey();
    _scaffoldProfileKey = GlobalKey();
  }
   GlobalKey get globalKey => auth ? _scaffoldAuthKey : _scaffoldProfileKey;
}
