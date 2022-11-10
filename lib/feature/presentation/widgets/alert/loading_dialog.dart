import 'package:flutter/material.dart';

void loadingDialog(BuildContext context) async {
  // show the loading dialog
  showDialog(
    // The user CANNOT close this dialog  by pressing outsite it
    barrierDismissible: false,
    context: context,
    builder: (c) {
      return Dialog(
        // The background color
        backgroundColor: Colors.white,
        child: SizedBox(
          width: 100,
          height: 100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
        ),
      );
    }
  );
}