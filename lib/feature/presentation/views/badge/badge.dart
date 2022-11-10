import 'package:badge/feature/presentation/blocs/badge/badge_bloc.dart';
import 'package:badge/feature/presentation/blocs/badge/badge_event.dart';
import 'package:badge/feature/presentation/blocs/badge/badge_state.dart';
import 'package:badge/feature/presentation/widgets/appbar/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widget/badges.dart';

class UserBadgesView extends StatelessWidget {
  final String userId;
  const UserBadgesView({required this.userId,super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BadgeBloc>(context).add(OnFetchUserBadges(userId: userId));
    return Scaffold(
      appBar: const Appbar(title: 'User Badges'),
      body: BlocBuilder<BadgeBloc, BadgeState>(
      builder: (context, state) {
        if (state is UserBadgesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is UserBadgesLoaded) {
          return Badges(badges: state.badges);
        }
        return Container();
      },
    )
   );
  }
}