import 'package:badge/feature/domain/domain.dart';
import 'package:badge/injector.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    goToNextPage(context); 
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 101, 180, 245),
      body: Center(
        child: Image(
          image: AssetImage('assets/images/badge.png'),
          width: 200,
          height: 200,
        ),
      ),
    );
  }

  void goToNextPage(BuildContext context) async {
    UserHasLoggedUseCase userHasLoggedUseCase = injector();
    IsAdminUseCase isAdminUseCase = injector();

    // Check user has logged or not
    var logged = await userHasLoggedUseCase.userHasLogged();
    await Future.delayed(const Duration(seconds: 2));

    // If has not logged go to Signup screen 
    if (logged) {
      if (await isAdminUseCase.isAdmin()) {
        Navigator.pushNamedAndRemoveUntil(context, 'Dashboard', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, 'Home', (route) => false);
      }
    } else {
      Navigator.pushNamedAndRemoveUntil(context, 'Signup', (route) => false);
    }
  }
}