import 'package:badge/feature/domain/domain.dart';
import 'package:badge/feature/presentation/blocs/home/home_bloc.dart';
import 'package:badge/feature/presentation/blocs/home/home_event.dart';
import 'package:badge/feature/presentation/blocs/home/home_state.dart';
import 'package:badge/feature/presentation/views/home/widgets/users.dart';
import 'package:badge/feature/presentation/widgets/appbar/appbar.dart';
import 'package:badge/injector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeBloc>(context).add(OnFetchUsers());
    return Scaffold(
      appBar: const Appbar(title: 'Home'),
      floatingActionButton: GestureDetector(
        onTap: () => _exitUser(context),
        child: Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle
          ),
          child: const Icon(
            Icons.exit_to_app,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is UsersLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is UsersLoaded) {
          return Users(users: state.users);
        }
        return Container();
      },
    )
   );
  }
  
  // Do exit
  void _exitUser(BuildContext context) async {
    ExitUserUseCase exitUserUseCase = injector();
    await exitUserUseCase.exitUser();
    Navigator.pushNamedAndRemoveUntil(context, 'Signup', (route) => false);
  }
}