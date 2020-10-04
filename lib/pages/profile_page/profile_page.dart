import 'package:animals_guard/bloc/user_bloc/user_bloc.dart';
import 'package:animals_guard/helpers/helpers.dart';
import 'package:animals_guard/helpers/no_glow_scroll_behaviour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'widgets/achievements.dart';
import 'widgets/structured_info.dart';

class ProfilePage extends StatelessWidget {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  Widget loadingScreen(
      {@required String caption, @required BuildContext context}) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              caption,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1.color,
                fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 65,
              width: 65,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor,
                ),
                backgroundColor: Theme.of(context).accentColor,
                strokeWidth: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Container(
                  child: ScrollConfiguration(
                    behavior: NoGlowScrollBehavior(),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: Helpers.responsiveWidth(30, context),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                              ),
                            ),
                            width: Helpers.responsiveWidth(300, context),
                          ),
                          Center(
                            child: Achievements(),
                          ),
                          SizedBox(
                            height: Helpers.responsiveWidth(30, context),
                          ),
                          StructuredInfo(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
