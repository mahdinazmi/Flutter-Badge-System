import 'package:equatable/equatable.dart';

class Badge extends Equatable {
  final int ? id;
  final int ? registeredBadgesCount;
  final String ? title;
  final String ? userId;

  const Badge({
    this.id,
    this.title,
    this.userId,
    this.registeredBadgesCount
  });

  @override
  List < Object ? > get props {
    return [
      id,
      title,
      userId,
      registeredBadgesCount
    ];
  }

  @override
  bool get stringify => true;
}