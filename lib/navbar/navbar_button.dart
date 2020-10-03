import 'package:animals_guard/helpers/helpers.dart';
import 'package:animals_guard/models/navbar_item_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';

class NavbarButton extends StatelessWidget {
  final NavbarItemData data;
  final bool isSelected;
  final VoidCallback onTap;
  NavbarButton({this.data, this.isSelected, this.onTap});

  @override
  Widget build(BuildContext context) {
    var content = Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
      child: Container(
        height: Helpers.responsiveHeight(40, context),
        width: Helpers.responsiveWidth(155, context),
        child: Center(
          child: Container(
            margin: EdgeInsets.only(
              bottom: Helpers.responsiveHeight(3, context),
            ),
            child: Icon(
              data.icon,
              color: isSelected ? Colors.black : Theme.of(context).cardColor,
              size: Helpers.responsiveHeight(28, context),
            ),
          ),
        ),
      ),
    );
    return GestureDetector(
      onTap: onTap,
      child: content,
    );
  }
}
