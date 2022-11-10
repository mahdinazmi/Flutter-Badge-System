import 'package:badge/feature/data/models/user/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class UserLocalDataSource {
  Future < void > registerUser(UserModel user);
  Future < bool > userHasLogged();
  Future < bool > isAdmin();
  Future < void > exitUser();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  
  /// Register user information on local database
  @override
  Future < void > registerUser(UserModel user) async {
    final userBox = Hive.box('user');
    await userBox.putAll(user.localToMap());
  }
  
  /// Check user has logged or not 
  @override
  Future < bool > userHasLogged() async {
    final userBox = Hive.box('user');
    return userBox.isNotEmpty;
  }
  
  /// Check user which logged is admin or not
  @override
  Future < bool > isAdmin() async {
    final userBox = Hive.box('user');
    var role = userBox.get('role');
    return role == 1 ? true : false;
  }
  
  /// Clear user box data by user exiting
  @override
  Future < void > exitUser() async {
    final userBox = Hive.box('user');
    await userBox.clear();
  }
}