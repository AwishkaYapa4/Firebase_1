import 'package:flutter/material.dart';

class UserLoginIn extends StatelessWidget {
  const UserLoginIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            decoration: const BoxDecoration(),
            child: Image(image: AssetImage('images/login.jpg')),
          ),
        ],
      ),
    );
  }
}
