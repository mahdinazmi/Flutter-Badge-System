import 'package:badge/feature/domain/repositories/user/user_repository.dart';

class UserLogInUseCase {

  final UserRepository _userRepository;

  UserLogInUseCase(this._userRepository);

  Future<void> userLogIn({required String userName,required String password}) async {
    return await _userRepository.userLogIn(userName,password);
  }

}
