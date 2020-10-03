part of 'news_bloc.dart';

abstract class NewsBlocState extends Equatable {
  @override
  List<Object> get props => [];
}

class NewsBlocInitial extends NewsBlocState {}

class StartLoading extends NewsBlocState {
  final BlocKey blocKey = BlocKey();
  @override
  List<Object> get props => [blocKey];
}

class FinishLoadingNews extends NewsBlocState {
  final BlocKey blocKey = BlocKey();
  @override
  List<Object> get props => [blocKey];
}


class FinishRefreshNews extends NewsBlocState {
  final BlocKey blocKey = BlocKey();

  @override
  List<Object> get props => [blocKey];
}
