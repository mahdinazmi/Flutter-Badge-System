import 'package:badge/feature/data/models/user/user_model.dart';
import 'package:badge/feature/domain/entities/user/user_entity.dart';

abstract class UserRepository {
  Future < void > registerUser(UserModel user);
  Future < void > registerUserOnLocal(UserModel user);
  Future < void > userLogIn(String userName, String password);
  Future < List < User >> fetchUsers();
  Future < bool > checkUserExist(String userName, String password);
  Future < bool > userHasLogged();
  Future < bool > isAdmin();
  Future < void > exitUser();
}