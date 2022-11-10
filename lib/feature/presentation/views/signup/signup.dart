import 'package:flutter/material.dart';
import 'widgets/appbar.dart';
import 'widgets/fields.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SignUpAppBar(),
      body: SignUpFields(),
    );
  }
}