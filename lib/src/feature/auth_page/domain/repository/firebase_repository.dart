import 'package:dartz/dartz.dart';
import 'package:untitled9/core/error_jurnal/error_jurnal.dart';
import 'package:untitled9/src/feature/auth_page/data/models/user_details.dart';

import 'package:untitled9/src/feature/auth_page/domain/entities/registration_details.dart';

abstract interface class FirebaseRepository {
  Future<Either<Failure, String>> loginInServise(RegistrationDetails details);

  Future<Either<Failure, String>> onRegister(RegistrationDetails details);

  Future<Either<Failure, String>> checkVerificationMail();

  Future<Either<Failure, bool>> verificationMail();

  Future<Either<Failure, String>> sendPasswordResetEmail(String email);

  Stream<Either<Failure, UserDetails>> checkUserStatus();

  Future<Either<Failure, bool>> logOut();
}
