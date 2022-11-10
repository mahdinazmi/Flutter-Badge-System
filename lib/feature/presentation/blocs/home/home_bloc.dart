import 'package:badge/feature/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchUsersUseCase _fetchUsersUseCase;

  HomeBloc(this._fetchUsersUseCase) : super(UsersLoading()) {
     on <OnFetchUsers>(
      (event, emit) async {
        emit(UsersLoading());
        var users = await _fetchUsersUseCase.fetchUsers();
        emit(UsersLoaded(users: users));
      },
    );
  }

}