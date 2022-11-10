import 'package:badge/feature/domain/domain.dart';
import 'package:badge/feature/presentation/widgets/widgets.dart';
import 'package:badge/injector.dart';
import 'package:flutter/material.dart';

class LogInFields extends StatelessWidget {
  LogInFields({super.key,});

  final TextEditingController _usernameEditingController = TextEditingController();
  final TextEditingController _passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _userNameField(),
          const SizedBox(height: 20,),
          _passwordField(),
          Button(
           title: 'Login',
           function: () => _userLogin(context)
         )
        ],
      ),
    );
  }

  Widget _userNameField() {
    return TextFormField(
      controller: _usernameEditingController,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black45,
            width: 0.5
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 0.1
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.0
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        contentPadding: EdgeInsets.all(15),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 0.1
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        labelStyle: TextStyle(
          fontSize: 14,
          color: Colors.black45,
        ),
        prefixIcon: Icon(Icons.person, size: 25, color: Colors.blue, ),
        hintStyle: TextStyle(
          fontSize: 18,
          color: Colors.grey
        ),
        labelText: "Username"
      ),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      obscureText: true,
      controller: _passwordEditingController,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black45,
            width: 0.5
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 0.1
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.0
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        contentPadding: EdgeInsets.all(15),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 0.1
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        labelStyle: TextStyle(
          fontSize: 14,
          color: Colors.black45,
        ),
        prefixIcon: Icon(Icons.password, size: 25, color: Colors.blue, ),
        hintStyle: TextStyle(
          fontSize: 18,
          color: Colors.grey
        ),
        labelText: "Password"
      ),
    );
  }
  
 
  // Do login
  void _userLogin(BuildContext context) async {
    loadingDialog(context);
    UserLogInUseCase userLogInUseCase = injector();
    CheckUserExistUseCase checkUserExistUseCase = injector();
    IsAdminUseCase isAdminUseCase = injector();

    // Check that user with this username and password exist in system or not
    var result = await checkUserExistUseCase.checkUserExist(
      userName: _usernameEditingController.value.text,
      password: _passwordEditingController.value.text
    );

    // If there is not any user with this info display a message
    if (!result) {
      Navigator.pop(context);
      var snackBar = const SnackBar(content: Text('There is no user with this information'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      await userLogInUseCase.userLogIn(userName: _usernameEditingController.value.text, password: _passwordEditingController.value.text);

      // Check this user is a admin or not if is a admin go to dashboard else go to home
      if (await isAdminUseCase.isAdmin()) {
        Navigator.pushNamedAndRemoveUntil(context, 'Dashboard', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, 'Home', (route) => false);
      }
    }
  }
  
}