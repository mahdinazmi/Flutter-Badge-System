import 'package:badge/feature/data/models/user/user_model.dart';
import 'package:badge/feature/domain/repositories/user/user_repository.dart';

class RegisterUserOnLocalUseCase {

  final UserRepository _userRepository;

  RegisterUserOnLocalUseCase(this._userRepository);

  Future<void> regitserUserOnLocal(UserModel user) async {
    return await  _userRepository.registerUserOnLocal(user);
  }
}