import 'package:badge/feature/data/models/badge/badge_model.dart';
import 'package:badge/feature/domain/repositories/badge/badge_repository.dart';

class RegisterBadgeUseCase {

  final BadgeRepository _badgeRepository;

  RegisterBadgeUseCase(this._badgeRepository);

  Future<void> registerBadge(BadgeModel badge) {
    return _badgeRepository.registerBadge(badge);
  }
  
}