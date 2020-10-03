part of 'news_bloc.dart';

abstract class NewsBlocEvent extends Equatable {
  const NewsBlocEvent();

  @override
  List<Object> get props => [];
}


class GetNewsFromServer extends NewsBlocEvent {
  GetNewsFromServer();
  @override
  List<Object> get props => [];
}

class FinishRefresh extends NewsBlocEvent{
   @override
  List<Object> get props => [];
}

class GetOneNews extends NewsBlocEvent {}

class LogOutEvent extends NewsBlocEvent {}

