import 'package:firebase_1/contains/color.dart';
import 'package:firebase_1/core/common/wideget/my_button.dart';
import 'package:firebase_1/user/auth/screen/user_login_in.dart';
import 'package:flutter/material.dart';
import '../../../go_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(boxShadow: [
                  
                ],
              ),
              child: Image(image: AssetImage('images/signup.avif')),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  TextField(
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: "Enter your name",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),
                  SizedBox(height: 20),
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
                  SizedBox(height: 15),

                  MyButton(onTap: () {}, buttonText: 'SignUp'),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Spacer(),
                      Text("Do You have an account?"),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          NavigationHelper.push(context, UserLoginIn());
                        },
                        child: Text(
                          "Login",
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
      ),
    );
  }
}
