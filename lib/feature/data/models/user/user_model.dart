import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../domain/entities/user/user_entity.dart';

class UserModel {

  String ? id;
  String ? fullName;
  String ? userName;
  String ? password;
  int ? role;

  UserModel({
    this.id,
    this.fullName,
    this.password,
    this.role,
    this.userName
  });

  
  Map < String, dynamic > toMap() {
    var map = < String, dynamic > {};
    map["fullName"] = fullName;
    map["userName"] = userName;
    map["password"] = password;
    map["role"] = role;
    return map;
  }

  Map < String, dynamic > localToMap() {
    var map = < String, dynamic > {};
    map["fullName"] = fullName;
    map["userName"] = userName;
    map["password"] = password;
    map["role"] = role;
    map["id"] = id;
    return map;
  }

  UserModel.fromDocument(DocumentSnapshot document) :
    userName = document.get('userName'),
    fullName = document.get('fullName'),
    password = document.get('password'),
    role = document.get('role');


  User toEntity() => User(
    fullName: fullName,
    password: password,
    userName: userName,
    role: role,
    id: id
  );

  void setUserId(String id) {
    this.id = id;
  }

}