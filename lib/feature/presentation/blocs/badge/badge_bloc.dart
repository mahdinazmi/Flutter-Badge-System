import 'package:badge/feature/domain/usecases/badge/fetch_badges_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'badge_event.dart';
import 'badge_state.dart';

class BadgeBloc extends Bloc<BadgeEvent, BadgeState> {
  final FetchUserBadgesUseCase _fetchUserBadgesUseCase;

  BadgeBloc(this._fetchUserBadgesUseCase) : super(UserBadgesLoading()) {
     on <OnFetchUserBadges>(
      (event, emit) async {
        emit(UserBadgesLoading());
        var badges = await _fetchUserBadgesUseCase.fetchUsersBadge(event.userId);
        emit(UserBadgesLoaded(badges: badges));
      },
    );
  }

}