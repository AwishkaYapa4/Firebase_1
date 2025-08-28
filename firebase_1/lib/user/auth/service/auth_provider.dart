import 'package:firebase_1/user/auth/model/auth_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class AuthoFromNotifier extends StateNotifier<AuthFromState> {
  AuthoFromNotifier() : super(AuthFromState());

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordHidden: !state.isPasswordHidden);
  }

  void updateName(String name) {
    String? nameError;
    if (name.isEmpty && name.length < 6) {
      nameError = "Provide your full name";
    }

    state = state.copyWith(name: name, nameError: nameError);
  }

  void updateEmail(String email) {
    String? emailError;
    if (email.isNotEmpty &&
        !RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        ).hasMatch(email)) {
      emailError = "Email can't be empty";
    }

    state = state.copyWith(email: email, emailError: emailError);
  }

  void updatePassword(String password) {
    String? passwordError;
    if (password.isNotEmpty && password.length < 6) {
      passwordError = "Password must be at least 6 characters";
    }

    state = state.copyWith(password: password, passwordError: passwordError);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  final authFromProvider =
      StateNotifierProvider<AuthoFromNotifier, AuthFromState>(
        (ref) => AuthoFromNotifier(),
      );
}
