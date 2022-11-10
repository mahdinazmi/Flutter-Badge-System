import 'package:badge/feature/presentation/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';

import 'widgets/fields.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(title: 'Login'),
      body: LogInFields(),
    );
  }
}