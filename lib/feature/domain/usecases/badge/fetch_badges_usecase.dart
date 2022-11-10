import 'package:badge/feature/domain/entities/badge/badge_entity.dart';
import 'package:badge/feature/domain/repositories/badge/badge_repository.dart';

class FetchUserBadgesUseCase {

  final BadgeRepository _badgeRepository;

  FetchUserBadgesUseCase(this._badgeRepository);

  Future<List<Badge>> fetchUsersBadge(String userId) {
    return _badgeRepository.fetchBadges(userId);
  }
  
}