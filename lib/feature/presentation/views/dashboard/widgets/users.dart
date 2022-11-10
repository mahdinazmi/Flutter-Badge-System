import 'package:badge/feature/data/models/badge/badge_model.dart';
import 'package:badge/feature/domain/entities/user/user_entity.dart';
import 'package:badge/feature/domain/usecases/badge/register_badge_usecase.dart';
import 'package:badge/feature/presentation/views/badge/badge.dart';
import 'package:badge/injector.dart';
import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  final List<User> users;
  const Users({required this.users , super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: users.length,
      padding: const EdgeInsets.all(10),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute < void > (
                  builder: (BuildContext context) => UserBadgesView(userId: users[index].id!),
                ),
              );
            },
            child: Container(
              height: 60,
              padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(227, 232, 239, 1),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      users[index].fullName.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15
                      ),
                    ),
                    PopupMenuButton(
                      icon: const Icon(Icons.add),
                      onSelected: (value) {
                        RegisterBadgeUseCase registerBadgeUseCase = injector();
                        BadgeModel badge = BadgeModel(
                          title: Options.values[value].name,
                          id: value,
                          userId: users[index].id
                        );
                        registerBadgeUseCase.registerBadge(badge);
                        var snackBar = const SnackBar(content: Text('The badge was registered'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      shape: const  RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                      ),
                      itemBuilder: (ctx) => [
                         _popupMenuItem('Batman', Icons.person, Options.batman.index),
                         _popupMenuItem('Spiderman', Icons.person, Options.spiderman.index),
                         _popupMenuItem('Sherlock', Icons.person, Options.sherlock.index),
                         _popupMenuItem('Joker', Icons.person, Options.joker.index),
                         _popupMenuItem('Ironman', Icons.person, Options.ironman.index),
                      ],
                    ),
                  ],
                ),
            ),
          );
        },
    );
  }

  PopupMenuItem _popupMenuItem( String title, IconData iconData, int position) {
    return PopupMenuItem(
      value: position,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Icon(
            iconData,
            color: Colors.blue
          ),
        ],
      ),
    );
  }
}

enum Options { batman, spiderman, sherlock, joker, ironman }