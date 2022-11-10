import 'package:badge/feature/data/models/user/user_model.dart';
import 'package:badge/feature/domain/domain.dart';
import 'package:badge/injector.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

abstract class UserRemoteDataSource {
  Future < void > registerUser(UserModel user);
  Future < void > userLogIn(String userName, String password);
  Future < List < User >> fetchUsers();
  Future < bool > checkUserExist(String userName, String password);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  
  /// Register user on firestore and local database
  @override
  Future < void > registerUser(UserModel user) async {
    RegisterUserOnLocalUseCase registerUserOnLocalUseCase = injector();
    var result = await FirebaseFirestore.instance.collection('user').add(user.toMap());
    user.setUserId(result.id);
    await registerUserOnLocalUseCase.regitserUserOnLocal(user);
  }
  
  /// User login by get user data with user name and password from Firestore 
  @override
  Future < void > userLogIn(String userName, String password) async {
    RegisterUserOnLocalUseCase registerUserOnLocalUseCase = injector();
    var result = await FirebaseFirestore.instance.collection('user').where('userName', isEqualTo: userName).where('password', isEqualTo: password).limit(1).get();
    UserModel user = UserModel.fromDocument(result.docs[0]);
    user.setUserId(result.docs[0].id);
    await registerUserOnLocalUseCase.regitserUserOnLocal(user);
  }
  
  /// Fetch all users data which register in system
  @override
  Future < List < User >> fetchUsers() async {
    List < User > users = [];
    QuerySnapshot < Map < String, dynamic >> tempUsers;
    IsAdminUseCase isAdminUseCase = injector();
    final userBox = Hive.box('user');
    var userId = userBox.get('id');
    tempUsers = await FirebaseFirestore.instance.collection('user').where('role', isNotEqualTo: 1).get();
    for (var user in tempUsers.docs) {
      if (await isAdminUseCase.isAdmin()) {
        UserModel tempUser = UserModel.fromDocument(user);
        tempUser.setUserId(user.id);
        users.add(tempUser.toEntity());
      } else {
        if (user.id != userId) {
          UserModel tempUser = UserModel.fromDocument(user);
          tempUser.setUserId(user.id);
          users.add(tempUser.toEntity());
        }
      }
    }
    return users;
  }
  
  /// Check that user with this username and password exist in system or not
  @override
  Future < bool > checkUserExist(String userName, String password) async {
    var result = await FirebaseFirestore.instance.collection('user').where('userName', isEqualTo: userName).where('password', isEqualTo: password).get();
    return result.size >= 1 ? true : false;
  }

}