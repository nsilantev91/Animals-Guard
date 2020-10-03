import 'package:animals_guard/models/navbar_item_data.dart';
import 'package:animals_guard/navbar/navbar_button.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final ValueChanged<int> itemTapped;
  final int currentIndex;
  final List<NavbarItemData> items;

  const CustomNavigationBar(
      {this.currentIndex = 0, this.itemTapped, this.items});

  NavbarItemData get selectedItem =>
      currentIndex >= 0 && currentIndex < items.length
          ? items[currentIndex]
          : null;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    List<Widget> buttons = items.map((data) {
      return NavbarButton(
        data: data,
        isSelected: data == selectedItem,
        onTap: () {
          var index = items.indexOf(data);
          itemTapped(index);
        },
      );
    }).toList();
    return Container(
      height: height * 50 / 740,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: buttons,
      ),
    );
  }
}
