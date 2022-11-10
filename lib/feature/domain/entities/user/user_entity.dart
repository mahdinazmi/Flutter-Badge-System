import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String ? id;
  final String ? userName;
  final String ? password;
  final String ? fullName;
  final int ? role;

  const User({
    this.id,
    this.userName,
    this.password,
    this.fullName,
    this.role
  });

  @override
  List < Object ? > get props {
    return [
      id,
      userName,
      password,
      fullName,
      role
    ];
  }

  @override
  bool get stringify => true;
}