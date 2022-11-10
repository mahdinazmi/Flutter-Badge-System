import 'package:badge/feature/domain/entities/user/user_entity.dart';
import 'package:badge/feature/domain/repositories/user/user_repository.dart';

class FetchUsersUseCase {

  final UserRepository _userRepository;

  FetchUsersUseCase(this._userRepository);

  Future<List<User>> fetchUsers() {
    return _userRepository.fetchUsers();
  }
}