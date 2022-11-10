import 'package:badge/feature/domain/domain.dart';

class ExitUserUseCase {

  final UserRepository _userRepository;

  ExitUserUseCase(this._userRepository);

  Future < void > exitUser() {
    return _userRepository.exitUser();
  }

}