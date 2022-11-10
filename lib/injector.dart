import 'package:badge/feature/data/data.dart';
import 'package:badge/feature/domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'feature/presentation/blocs/badge/badge_bloc.dart';
import 'feature/presentation/blocs/home/home_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  
  await AppDatabase.initializeDatabase();
  
  injector.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(remoteDataSource: injector(),localDataSource: injector()),);

  injector.registerLazySingleton<BadgeRepository>(() => BadgeRepositoryImpl(remoteDataSource: injector()),);
  
  injector.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(),);

  injector.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSourceImpl(),);

  injector.registerLazySingleton<BadgeRemoteDataSource>(() => BadgeRemoteDataSourceImpl(),);

  injector.registerLazySingleton(() => RegisterUserUseCase(injector()));

  injector.registerLazySingleton(() => RegisterUserOnLocalUseCase(injector()));

  injector.registerLazySingleton(() => UserLogInUseCase(injector()));

  injector.registerLazySingleton(() => CheckUserExistUseCase(injector()));

  injector.registerLazySingleton(() => IsAdminUseCase(injector()));

  injector.registerLazySingleton(() => UserHasLoggedUseCase(injector()));

  injector.registerLazySingleton(() => ExitUserUseCase(injector()));

  injector.registerLazySingleton(() => FetchUsersUseCase(injector()));

  injector.registerLazySingleton(() => RegisterBadgeUseCase(injector()));

  injector.registerLazySingleton(() => FetchUserBadgesUseCase(injector()));

  injector.registerFactory(() => HomeBloc(injector()));

  injector.registerFactory(() => BadgeBloc(injector()));


}