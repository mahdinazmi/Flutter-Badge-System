import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback function;
  const Button({required this.title,required this.function,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(30, 30, 30, 30),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all < Color > (Colors.blue),
            elevation: MaterialStateProperty.all(0.0),
            shape: MaterialStateProperty.all < RoundedRectangleBorder > (
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )
            )
          ),
          onPressed:function,
          child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal
              ),
            )
        )
    );
  }
}