import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled9/src/feature/auth_page/data/models/user_details.dart';
import 'package:untitled9/src/feature/auth_page/domain/entities/registration_details.dart';

abstract interface class IFirebaseService {
  Future<String> onLogin(RegistrationDetails details);
  Future<String> onRegister(RegistrationDetails details);
  Future<String> checkEmailVerified();
  Future<void> sendEMailVerification();
  Future<String> sendPasswordResetEmail(String email);
  Stream<UserDetails> onListenUser();
}

@injectable
class FirebaseService implements IFirebaseService {
  final currentUser = FirebaseAuth.instance.currentUser;

  final auth = FirebaseAuth.instance;

  @override
  Stream<UserDetails> onListenUser() {
    return auth
        .authStateChanges()
        .where((user) => user != null)
        .map((user) => UserDetails.fromFirebaseUser(
              user!.uid,
              user.email,
              user.emailVerified,
            ));
  }

  @override
  Future<String> onLogin(RegistrationDetails details) async {
    final String emailAddress = details.mail;
    final String password = details.password;
    details.password;
    String stateAuth;
    try {
      await auth.signInWithEmailAndPassword(
          email: emailAddress, password: password);
      if (await checkEmailVerified() == 'Почта подтверждена') {
        return stateAuth = 'Авторизация успешна';
      } else {
        return stateAuth = 'Ваша почта не подтверждена';
      }
    } on FirebaseAuthException catch (e) {
      // if (e.code == 'user-not-found') {
      // } else if (e.code == 'wrong-password') {}
      stateAuth = e.code.toString();
    }
    return stateAuth;
  }

  @override
  Future<String> onRegister(RegistrationDetails details) async {
    final String mail = details.mail;
    final String password = details.password;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: mail,
        password: password,
      );
      await sendEMailVerification();
      return 'Успешная регистрация';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'Слабый пароль';
      } else if (e.code == 'email-already-in-use') {
        return 'Этот электронный адрес уже занят';
      } else {
        return 'Произошла неизвестная ошибка';
      }
    } catch (e) {
      return 'Произошла неожиданная ошибка: $e';
    }
  }

  @override
  Future<bool> sendEMailVerification() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();

      return true;
    } else {
      return false;
    }
  }

  @override
  Future<String> checkEmailVerified() async {
    await auth.currentUser?.reload();
    if (auth.currentUser!.emailVerified) {
      return 'Почта подтверждена';
    } else {
      return 'Почта не подтверждена';
    }
  }

  Future<bool> logOut() async {
    try {
      await auth.signOut();
      return false;
    } catch (e) {
      return true;
    }
  }

  @override
  Future<String> sendPasswordResetEmail(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return 'Письмо успешно отправлено';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'Пользователь с таким адресом электронной почты не найден';
      } else {
        return e.code;
      }
    }
  }
}
