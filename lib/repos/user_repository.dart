import 'package:animals_guard/bloc/user_bloc/user_bloc.dart';
import 'package:animals_guard/main.dart';
import 'package:animals_guard/models/news_data.dart';
import 'package:animals_guard/models/point.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepos {
  bool _online;
  String _name;
  String _surname;
  String _secondName;
  String _phoneNumber;
  String _email;
  int _countStatements;
  int _countReposts;
  static Point address = Point(caption: '',position: LatLng(0,0));

  SharedPreferences _prefs;

  void _getPref() async {
    _prefs = await SharedPreferences.getInstance();
    if (_prefs.containsKey('name')) _name = _prefs.getString('name');
    if (_prefs.containsKey('surname'))_surname = _prefs.getString('surname');
    if (_prefs.containsKey('secondName'))_secondName = _prefs.getString('secondName');
    if (_prefs.containsKey('phoneNumber'))_phoneNumber = _prefs.getString('phoneNumber');
    if (_prefs.containsKey('email'))_email = _prefs.getString('email');
    MyApp.userBloc.add( GetLocalProfile());
  }

  UserRepos._() {
    _online = false;
    _name = "";
    _surname = "";
    _secondName = "";
    _phoneNumber = "";
    _email = "";
    _getPref();
  }

  static UserRepos _instance;
  static UserRepos getInstance() {
    if (_instance == null) {
      _instance = UserRepos._();
    }
    return _instance;
  }

  void setName(value) {
    _name = value;
    _prefs.setString("name", value);
  }

  void setSurname(value) {
    _surname = value;
    _prefs.setString("surname", value);
  }

  void setSecondName(value) {
    _secondName = value;
    _prefs.setString("secondName", value);
  }

  void setPhomeNumber(value) {
    _phoneNumber = value;
    _prefs.setString("email", value);
  }

  void setEmail(value) {
    _email = value;
    _prefs.setString("phoneNumber", value);
  }

  void setCountStatements(value) {
    _countStatements = value;
  }

  void setCountReposts(value) {
    _countReposts = value;
  }

  bool get online => _online;
  String get name => _name;
  String get surname => _surname;
  String get secondName => _secondName;
  String get phoneNumber => _phoneNumber;
  String get email => _email;
  int get countStatements => _countStatements;
  int get countReposts => _countReposts;

  void fromJson(Map<String, dynamic> json) {
    _name = json["name"];
    _surname = json["surname"];
    _secondName = json["second_name"];
    _phoneNumber = json["phone_number"];
    _email = json["email"];
    _countStatements = json["count_statements"];
    _countReposts = json["count_reposts"];
  }

  //новости
  static List<NewsData> news = [];

  static final _storage = new FlutterSecureStorage();
  // ignore: non_constant_identifier_names
  static Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await _storage.delete(key: 'token');
    return;
  }

  static Future<void> deleteNumber() async {
    /// delete from keystore/keychain
    await _storage.delete(key: 'number');
    return;
  }

  static Future<void> persistNumber(String number) async {
    /// write to keystore/keychain
    await _storage.write(key: 'number', value: number);
    var tk = await _storage.read(key: 'number');
    // print(tk);
    return;
  }

  static Future<bool> hasNumber() async {
    /// read from keystore/keychain
    var token = await _storage.read(key: 'number');
    return token != null;
  }

  static Future<String> getNumber() async {
    var token = await _storage.read(key: 'number');
    return token;
  }

  static Future<void> deletePassword() async {
    /// delete from keystore/keychain
    await _storage.delete(key: 'password');
    return;
  }

  static Future<void> persistPassword(String password) async {
    /// write to keystore/keychain
    await _storage.write(key: 'password', value: password);
    var tk = await _storage.read(key: 'password');
    // print(tk);
    return;
  }

  static Future<bool> hasPassword() async {
    /// read from keystore/keychain
    var token = await _storage.read(key: 'password');
    return token != null;
  }

  static Future<String> getPassword() async {
    var token = await _storage.read(key: 'password');
    return token;
  }
}
