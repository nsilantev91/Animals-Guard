import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../helpers/bloc_key.dart';
import '../../helpers/requests.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsBlocEvent, NewsBlocState> {

  NewsBloc() : super(StartLoading());

  Stream<NewsBlocState> _getNews() async* {
    await Requests.getNews();
    yield FinishLoadingNews();
  }

  @override
  Stream<NewsBlocState> mapEventToState(
    NewsBlocEvent event,
  ) async* {
    if (event is GetNewsFromServer) {
      yield* _getNews();
    } else if (event is FinishRefresh) {
      yield FinishRefreshNews();
    }
  }
}
