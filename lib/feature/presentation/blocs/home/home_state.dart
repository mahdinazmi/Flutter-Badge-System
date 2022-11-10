import 'package:badge/feature/domain/entities/user/user_entity.dart';

abstract class HomeState{}

class UsersLoading extends HomeState {}

class UsersLoaded extends HomeState {
  final List<User> users ;

  UsersLoaded({required this.users});
}