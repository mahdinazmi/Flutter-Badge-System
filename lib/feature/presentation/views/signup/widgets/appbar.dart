import 'package:flutter/material.dart';

class SignUpAppBar extends StatelessWidget with PreferredSizeWidget {
  const SignUpAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      centerTitle: true,
      elevation: 0.0,
      title: const Text(
        'Register'
      )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}