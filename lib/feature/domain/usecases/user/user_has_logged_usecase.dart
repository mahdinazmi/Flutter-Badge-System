import 'package:badge/feature/domain/domain.dart';

class UserHasLoggedUseCase {

  final UserRepository _userRepository;

  UserHasLoggedUseCase(this._userRepository);

  Future<bool> userHasLogged() {
    return _userRepository.userHasLogged();
  }
  
}