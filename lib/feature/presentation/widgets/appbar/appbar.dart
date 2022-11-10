import 'package:flutter/material.dart';

class Appbar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const Appbar({required this.title , super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      centerTitle: true,
      elevation: 0.0,
      title: Text(
        title
      )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}