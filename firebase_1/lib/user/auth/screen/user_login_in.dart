import 'package:firebase_1/contains/color.dart';
import 'package:firebase_1/core/common/wideget/my_button.dart';
import 'package:firebase_1/go_route.dart';
import 'package:flutter/material.dart';
import 'sign_up_screen.dart';

class UserLoginIn extends StatelessWidget {
  const UserLoginIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: shadowColor, blurRadius: 15, spreadRadius: 20),
              ],
            ),
            child: Image(image: AssetImage('images/login.jpg')),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                TextField(
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Enter your email",
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  autocorrect: false,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "Enter your password",
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
                SizedBox(height: 20),

                MyButton(onTap: () {}, buttonText: 'Login'),
                SizedBox(height: 15),
                Row(
                  children: [
                    Spacer(),
                    Text("Don't have an account?"),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        NavigationHelper.push(context, SignUpScreen());
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
