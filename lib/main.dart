import 'package:badge/feature/presentation/blocs/badge/badge_event.dart';
import 'package:badge/feature/presentation/blocs/home/home_event.dart';
import 'package:badge/feature/presentation/views/badge/badge.dart';
import 'package:badge/feature/presentation/views/home/home.dart';
import 'package:badge/feature/presentation/views/home/widgets/users.dart';
import 'package:badge/feature/presentation/views/login/login.dart';
import 'package:badge/feature/presentation/views/signup/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/presentation/blocs/badge/badge_bloc.dart';
import 'feature/presentation/blocs/home/home_bloc.dart';
import 'feature/presentation/views/dashboard/admin_dashboard.dart';
import 'feature/presentation/views/splash/splash.dart';
import 'injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider < HomeBloc > (
          create: (_) => injector()..add(OnFetchUsers()),
        ),
         BlocProvider < BadgeBloc > (
          create: (_) => injector()..add(OnFetchUserBadges(userId: '')),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'Login': (context) => const LogInView(),
          'Signup' :(context) => const SignUpView(),
          'Dashboard' : (context) => const AdminDashboardView(),
          'Home' : (context) => const HomeView(),
          'UserBadges' : (context) => const UserBadgesView(userId:''),
          'Users' : (context) => const Users(users: [])
        },
        home: const SplashView()
      ),
    );
  }
  }
