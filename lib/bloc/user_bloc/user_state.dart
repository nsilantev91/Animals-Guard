part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadingUserData extends UserState {
   @override
  List<Object> get props => [blocKey];
  final BlocKey blocKey=BlocKey();
  
}

class UserDataHasLoaded extends UserState{
   @override
  List<Object> get props => [blocKey];
  final BlocKey blocKey=BlocKey();
}

class BlocKey{

}