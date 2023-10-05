import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled9/core/error_jurnal/error_jurnal.dart';
import 'package:untitled9/src/feature/auth_page/data/data_source/auth_firebase_service.dart';
import 'package:untitled9/src/feature/auth_page/data/models/user_details.dart';
import 'package:untitled9/src/feature/auth_page/domain/entities/registration_details.dart';
import 'package:untitled9/src/feature/auth_page/domain/repository/firebase_repository.dart';

@Injectable(as: FirebaseRepository)
class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseService firebaseService;
  const FirebaseRepositoryImpl({
    required this.firebaseService,
  });

  @override
  Future<Either<Failure, String>> loginInServise(
      RegistrationDetails details) async {
    return await _loginInServise(details);
  }

  Future<Either<Failure, String>> _loginInServise(
      RegistrationDetails details) async {
    try {
      final loggedIn = await firebaseService.onLogin(details);
      return Right(loggedIn);
    } on Failure catch (e) {
      throw Left(ServerError(error: e));
    }
  }

  @override
  Future<Either<Failure, String>> onRegister(
      RegistrationDetails details) async {
    return await _onRegister(details);
  }

  Future<Either<Failure, String>> _onRegister(
      RegistrationDetails details) async {
    try {
      final register = await firebaseService.onRegister(details);
      return Right(register);
    } on Failure catch (e) {
      throw Left(ServerError(error: e));
    }
  }

  @override
  Future<Either<Failure, String>> checkVerificationMail() async {
    return await _checkVerificationMail();
  }

  Future<Either<Failure, String>> _checkVerificationMail() async {
    try {
      final verification = await firebaseService.checkEmailVerified();
      return Right(verification);
    } on Failure catch (e) {
      throw Left(ServerError(error: e));
    }
  }

  @override
  Future<Either<Failure, bool>> verificationMail() async {
    return await _verificationMail();
  }

  Future<Either<Failure, bool>> _verificationMail() async {
    try {
      final verification = await firebaseService.sendEMailVerification();
      return Right(verification);
    } on Failure catch (e) {
      throw Left(ServerError(error: e));
    }
  }

  @override
  Future<Either<Failure, String>> sendPasswordResetEmail(String email) async {
    return await _sendPasswordResetEmail(email);
  }

  Future<Either<Failure, String>> _sendPasswordResetEmail(String email) async {
    try {
      final message = await firebaseService.sendPasswordResetEmail(email);
      return Right(message);
    } on Failure catch (e) {
      throw Left(ServerError(error: e));
    }
  }

  @override
  Stream<Either<Failure, UserDetails>> checkUserStatus() {
    final controller = StreamController<Either<Failure, UserDetails>>();

    firebaseService.onListenUser().listen(
      (user) {
        controller.add(Right(user));
      },
      onError: (error) {
        controller.add(Left(ServerError(error: error.toString())));
      },
    );

    return controller.stream;
  }

  @override
  Future<Either<Failure, bool>> logOut() async {
    return await _logOut();
  }

  Future<Either<Failure, bool>> _logOut() async {
    try {
      final message = await firebaseService.logOut();

      return Right(message);
    } on Failure catch (e) {
      throw Left(ServerError(error: e));
    }
  }
}
