import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled9/core/error_jurnal/error_jurnal.dart';
import 'package:untitled9/core/use_case/use_case.dart';

import 'package:untitled9/src/feature/auth_page/domain/repository/firebase_repository.dart';

@injectable
class SendPasswordResetEmail implements UseCase<String, String> {
  final FirebaseRepository firebaseRepository;
  SendPasswordResetEmail({
    required this.firebaseRepository,
  });
  @override
  Future<Either<Failure, String>> call(String email) async {
    return await firebaseRepository.sendPasswordResetEmail(email);
  }
}
