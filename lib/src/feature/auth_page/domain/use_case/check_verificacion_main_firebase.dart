import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled9/core/error_jurnal/error_jurnal.dart';
import 'package:untitled9/core/use_case/use_case.dart';

import 'package:untitled9/src/feature/auth_page/domain/repository/firebase_repository.dart';

@injectable
class CheckVerificationMailFirebase implements UseCase<String, NoParams> {
  final FirebaseRepository firebaseRepository;
  CheckVerificationMailFirebase({
    required this.firebaseRepository,
  });
  @override
  Future<Either<Failure, String>> call(NoParams noParams) async {
    return await firebaseRepository.checkVerificationMail();
  }
}
