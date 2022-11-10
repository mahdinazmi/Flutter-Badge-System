import 'package:badge/feature/data/models/badge/badge_model.dart';
import 'package:badge/feature/domain/entities/badge/badge_entity.dart';

abstract class BadgeRepository {
  Future<void> registerBadge(BadgeModel badge);
  Future<List<Badge>> fetchBadges(String userId);
}