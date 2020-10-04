import 'dart:async';

import 'package:animals_guard/helpers/helpers.dart';
import 'package:animals_guard/helpers/requests.dart';
import 'package:animals_guard/main.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(LoadingUserData());

  Stream<UserState> _getProfile() async* {
    await Requests.getProfile();
    yield UserDataHasLoaded();
  }

  Stream<UserState> _sentDataToServer() async* {
    yield LoadingUserData();

    yield UserDataHasLoaded();
  }

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is GetProfileFromServer) {
      yield* _getProfile();
    } else if (event is SentDataToServer) {
      yield* _sentDataToServer();
    } else if (event is GetLocalProfile) {
      yield UserDataHasLoaded();
    }
  }
}
