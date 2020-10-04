import 'package:animals_guard/helpers/helpers.dart';
import 'package:animals_guard/helpers/notifications.dart';
import 'package:animals_guard/helpers/requests.dart';
import 'package:animals_guard/pages/auth_page/widgets/agreement.dart';
import 'package:animals_guard/pages/auth_page/widgets/auth_button.dart';
import 'package:animals_guard/pages/auth_page/widgets/auth_text_field.dart';
import 'package:animals_guard/pages/navigation_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController _passController;
  TextEditingController _emailController;
  @override
  void initState() {
    _emailController = TextEditingController(text: 'LubitelGivotnix@gmail.com');
    _passController = TextEditingController(text: 'LubitelGivotnix');
    super.initState();
  }

  @override
  void dispose() {
    _passController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Requests.setTempPushToken();
    FCMNotifications()..initialise();
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthTextField('Email', _emailController),
            SizedBox(
              height: Helpers.responsiveHeight(24, context),
            ),
            AuthTextField('Пароль', _passController),
            SizedBox(
              height: Helpers.responsiveHeight(60, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AuthButton(
                  text: 'Зарегистрироваться',
                  color: Theme.of(context).buttonColor,
                  function: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavigationPage(),
                    ),
                  ),
                ),
                AuthButton(
                  text: 'Пропустить',
                  color: Theme.of(context).cardColor,
                  function: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavigationPage(),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: Helpers.responsiveHeight(30, context),
            ),
            Agreement(),
          ],
        ),
      ),
    );
  }
}
