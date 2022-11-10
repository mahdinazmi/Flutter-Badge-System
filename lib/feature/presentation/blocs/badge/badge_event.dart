abstract class BadgeEvent {}

class OnFetchUserBadges extends BadgeEvent {
  final String userId;
  OnFetchUserBadges({required this.userId});
}