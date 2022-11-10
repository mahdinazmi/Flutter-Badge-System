

import 'package:badge/core/usecase/usecase.dart';
import 'package:badge/feature/data/models/user/user_model.dart';
import 'package:badge/feature/domain/repositories/user/user_repository.dart';

class RegisterUserUseCase implements UseCase<void, UserModel> {
  final UserRepository _userRepository;

  RegisterUserUseCase(this._userRepository);

  @override
  Future<void> call({required UserModel params}) async {
    return await _userRepository.registerUser(params);
  }
}
