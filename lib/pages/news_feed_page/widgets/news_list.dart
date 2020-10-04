import 'dart:io';

import 'package:animals_guard/bloc/news_bloc/news_bloc.dart';
import 'package:animals_guard/helpers/helpers.dart';
import 'package:animals_guard/helpers/no_glow_scroll_behaviour.dart';
import 'package:animals_guard/helpers/requests.dart';
import 'package:animals_guard/repos/user_repository.dart';
import 'package:animals_guard/models/news_data.dart';
import 'package:animals_guard/pages/news_feed_page/widgets/news_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart' as ref;

class NewsList extends StatelessWidget {
  final List<NewsData> _newsList = UserRepos.news;

  ref.RefreshController _refreshController = ref.RefreshController();

  Future<void> _refresh() async {
    await Requests.getNews();
    _refreshController.refreshCompleted();
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Helpers.responsiveHeight(505, context),
      child: BlocBuilder<NewsBloc, NewsBlocState>(builder: (context, state) {
        if (state is StartLoading) {
          return Platform.isAndroid
              ? Center(child: CircularProgressIndicator())
              : Center(
                  child: CupertinoActivityIndicator(),
                );
        } else if (state is FinishLoadingNews) {
          return ref.SmartRefresher(
            header: Platform.isAndroid
                ? ref.MaterialClassicHeader()
                : ref.ClassicHeader(
                    refreshingIcon: CupertinoActivityIndicator(),
                    refreshingText: '',
                    releaseIcon: CupertinoActivityIndicator(),
                    releaseText: '',
                    completeIcon: CupertinoActivityIndicator(),
                    completeText: '',
                    idleIcon: null,
                    idleText: '',
                  ),
            controller: _refreshController,
            onRefresh: () => _refresh(),
            child: ScrollConfiguration(
              behavior: NoGlowScrollBehavior(),
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: Helpers.responsiveWidth(24, context),
                ),
                itemBuilder: (_, index) {
                  var item = NewsItem(UserRepos.news[index]);
                  if (index == 0) {
                    return Container(
                      margin: EdgeInsets.only(
                        top: Helpers.responsiveHeight(15, context),
                      ),
                      child: item,
                    );
                  } else if (index == _newsList.length - 1) {
                    return Container(
                      margin: EdgeInsets.only(
                        bottom: Helpers.responsiveHeight(15, context),
                      ),
                      child: item,
                    );
                  } else
                    return item;
                },
                separatorBuilder: (_, __) => SizedBox(
                  height: Helpers.responsiveHeight(24, context),
                ),
                itemCount: UserRepos.news.length,
              )));
        }
      }),
    );
  }
}
