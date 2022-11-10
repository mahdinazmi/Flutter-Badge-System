import 'package:badge/feature/domain/entities/badge/badge_entity.dart';
import 'package:flutter/material.dart';

class Badges extends StatelessWidget {
  final List<Badge> badges;
  const Badges({required this.badges , super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: badges.length,
      padding: const EdgeInsets.all(10),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
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
                    badges[index].title.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15
                    ),
                  ),
                  Text(
                    badges[index].registeredBadgesCount.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15
                    ),
                  ),
                ],
              ),
          );
        },
    );
  }
}