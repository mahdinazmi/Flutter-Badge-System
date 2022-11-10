import 'package:badge/feature/data/models/user/user_model.dart';
import 'package:badge/feature/domain/domain.dart';
import 'package:badge/feature/presentation/views/home/home.dart';
import 'package:badge/feature/presentation/widgets/widgets.dart';
import 'package:badge/injector.dart';
import 'package:flutter/material.dart';

class SignUpFields extends StatelessWidget {
  SignUpFields({super.key});

  final TextEditingController _fullNameEditingController = TextEditingController();
  final TextEditingController _usernameEditingController = TextEditingController();
  final TextEditingController _passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _fullNameField(),
          const SizedBox(height: 20,),
          _userNameField(),
          const SizedBox(height: 20,),
          _passwordField(),
          Button(
           title: 'Register',
           function: () => _registerUser(context)
         ),
         _logIn(context)
        ],
      ),
    );
  }

  Widget _fullNameField() {
    return TextFormField(
      controller: _fullNameEditingController,
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
        labelText: "Full Name"
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
  
  Widget _logIn(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'Login'),
      child: const Text(
        'Do you have an account?',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 15
        ),
      ),
    );
  }
  
  void _registerUser(BuildContext context) async {

    // Display loading dialog
    loadingDialog(context);
    RegisterUserUseCase registerUserUseCase = injector();
    
    // Create a user model
    var user = UserModel(
      fullName: _fullNameEditingController.value.text,
      password: _passwordEditingController.value.text,
      userName: _usernameEditingController.value.text,
      role: 2
    );

    // Register user
    await registerUserUseCase(params: user);
    await Future.delayed(const Duration(seconds: 2));

    // Go to home page
    Navigator.pushNamedAndRemoveUntil(context, 'Home', (route) => false);
  }
  
}