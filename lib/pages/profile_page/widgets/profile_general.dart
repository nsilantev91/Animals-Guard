import 'package:animals_guard/helpers/helpers.dart';
import 'package:flutter/material.dart';

class ProfileGeneral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Helpers.responsiveHeight(150, context),
          width: Helpers.responsiveHeight(150, context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.elliptical(9999.0, 9999.0),
            ),
            image: DecorationImage(
              image: const AssetImage('assets/images/avatar.jpg'),
              fit: BoxFit.cover,
            ),
            border: Border.all(width: 3.0, color: const Color(0xffffffff)),
          ),
        ),
        Text(
          'Иванов Иван',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 28,
            color: const Color(0xff000000),
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
