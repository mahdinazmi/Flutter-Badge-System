import 'package:badge/feature/domain/domain.dart';

class IsAdminUseCase {

  final UserRepository _userRepository;

  IsAdminUseCase(this._userRepository);

  Future < bool > isAdmin() {
    return _userRepository.isAdmin();
  }

}