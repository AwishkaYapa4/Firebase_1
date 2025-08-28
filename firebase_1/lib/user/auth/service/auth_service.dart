import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_1/user/auth/screen/sign_up_screen.dart';
import 'package:firebase_1/user/auth/screen/user_login_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class AuthMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> SignUpScreen({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      if (email.isNotEmpty || password.isNotEmpty || name.isNotEmpty) {
        return "Please enter all the fields";
      }
      // register user
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // add user to our database
      await _firestore.collection("users").doc(cred.user!.uid).set({
        "name": name,
        "uid": cred.user!.uid,
        "email": email,
        "cretedAt": FieldValue.serverTimestamp(),
      });
      return "success";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> UserLoginIn({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        return "Please enter all the fields";
      }

      await _auth.signInWithEmailAndPassword(email: email, password: password);

      return "success";
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

final authMethodProvider = Provider<AuthMethod>((ref) {
  return AuthMethod();
});