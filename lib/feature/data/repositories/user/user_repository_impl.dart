import 'package:badge/feature/data/datasources/local/user/user_local_data_source.dart';
import 'package:badge/feature/data/datasources/remote/user/user_remote_data_source.dart';
import 'package:badge/feature/data/models/user/user_model.dart';
import 'package:badge/feature/domain/entities/user/user_entity.dart';
import 'package:badge/feature/domain/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource
  });

  @override
  Future < void > registerUser(UserModel user) async {
    await remoteDataSource.registerUser(user);
  }

  @override
  Future < void > userLogIn(String userName, String password) async {
    await remoteDataSource.userLogIn(userName, password);
  }

  @override
  Future < List < User >> fetchUsers() async {
    List < User > users = [];
    users = await remoteDataSource.fetchUsers();
    return users;
  }

  @override
  Future < void > registerUserOnLocal(UserModel user) async {
    await localDataSource.registerUser(user);
  }

  @override
  Future < bool > checkUserExist(String userName, String password) async {
    return await remoteDataSource.checkUserExist(userName, password);
  }

  @override
  Future < bool > userHasLogged() async {
    return await localDataSource.userHasLogged();
  }

  @override
  Future < bool > isAdmin() async {
    return await localDataSource.isAdmin();
  }

  @override
  Future < void > exitUser() async {
    await localDataSource.exitUser();
  }
}