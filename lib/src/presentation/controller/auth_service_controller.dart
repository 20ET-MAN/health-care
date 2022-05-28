import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AuthServiceController extends ChangeNotifier {
  static Future<auth.User?> registerUsingEmailPassword({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    EasyLoading.show(
      status: 'Vui lòng đợi.....',
    );
    auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
    User? user;
    if (email.isEmpty) {
      EasyLoading.showError('Vui lòng nhập Email');
    } else if (password.length < 8) {
      EasyLoading.showError('Mật khẩu phải có ít nhất 8 kí tự');
    } else if (confirmPassword != password) {
      EasyLoading.showError('Mật khẩu không khớp');
    } else {
      try {
        UserCredential userCredential =
            await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          EasyLoading.showError('Mật khẩu quá yếu');
        } else if (e.code == 'email-already-in-use') {
          EasyLoading.showError('Email đã tồn tại');
        } else if (e.code == 'invalid-email') {
          EasyLoading.showError('Email không hợp lệ');
        } else {
          print('>>>>>>>>>>>>>>>>>>>>>>>>>>>${e.code.toString()}');
        }
      }
      //EasyLoading.showSuccess('success');
    }
    return user;
  }

  // For signing in an user (have already registered)
  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String typeUser,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    EasyLoading.show(
      status: 'Vui lòng đợi.....',
    );
    if (email.isEmpty) {
      EasyLoading.showError('Vui lòng nhập Email');
    } else if (password.isEmpty) {
      EasyLoading.showError('Vui lòng nhập mật khẩu');
    }
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (email.isNotEmpty && password.isNotEmpty && e.code.isNotEmpty) {
        switch (e.code) {
          case 'invalid-email':
            {
              EasyLoading.showError('Email không tồn tại');
              break;
            }
          case 'wrong-password':
            {
              EasyLoading.showError('Sai mật khẩu');
              break;
            }
          case 'user-not-found':
            {
              EasyLoading.showError('Tài khoản không tồn tại');
              break;
            }
        }
      }
    }
    return user;
  }

  static Future<User?> getCurrentUser() async {
    final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
    return await _firebaseAuth.currentUser;
  }

  static Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }
}
