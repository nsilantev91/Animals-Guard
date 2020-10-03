import 'package:animals_guard/appbar/custom_appbar.dart';
import 'package:animals_guard/bloc/news_bloc/news_bloc.dart';
import 'package:animals_guard/main.dart';
import 'package:animals_guard/models/navbar_item_data.dart';
import 'package:animals_guard/navbar/custom_navigation_bar.dart';
import 'package:animals_guard/pages/news_feed_page/news_feed_page.dart';
import 'package:animals_guard/pages/reports_page/reports_page.dart';
import 'package:flutter/material.dart';

import 'profile_page/profile_page.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  void _tapHandler(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<NavbarItemData> _items;
  @override
  void initState() {
    _items = [
      NavbarItemData(icon: Icons.new_releases, text: "Новости"),
      NavbarItemData(icon: Icons.face, text: "Профиль"),
    ];

    super.initState();
  }

  List<Widget> pages = [
    NewsFeedPage(),
    ProfilePage(),
  ];

  List<String> appbarTitles = [
    "Новостная лента",
    "Профиль",
  ];

  @override
  Widget build(BuildContext context) {
    MyApp.newsBloc.add(GetNewsFromServer());
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).buttonColor,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ReportsPage(),
              ),
            );
          },
          elevation: 0,
          child: Icon(Icons.edit),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: CustomNavigationBar(
            currentIndex: _selectedIndex,
            itemTapped: _tapHandler,
            items: _items,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomAppbar(appbarTitles[_selectedIndex]),
              Expanded(
                child: IndexedStack(
                  children: pages,
                  index: _selectedIndex,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
