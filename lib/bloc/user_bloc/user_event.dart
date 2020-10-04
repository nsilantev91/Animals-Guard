part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class GetProfileFromServer extends UserEvent{}

class SentDataToServer extends UserEvent{}

class GetLocalProfile extends UserEvent{} 
