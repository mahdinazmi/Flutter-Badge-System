import 'package:badge/feature/domain/domain.dart';

class CheckUserExistUseCase {

  final UserRepository _userRepository;

  CheckUserExistUseCase(this._userRepository);

  Future<bool> checkUserExist({required String userName,required String password}) {
    return _userRepository.checkUserExist(userName, password);
  }
  
}