import 'package:badge/feature/domain/entities/badge/badge_entity.dart';

abstract class BadgeState {}

class UserBadgesLoading extends BadgeState {}

class UserBadgesLoaded extends BadgeState {
  final List<Badge> badges;

  UserBadgesLoaded ({required this.badges});
}