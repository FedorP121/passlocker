import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled9/core/error_jurnal/error_jurnal.dart';
import 'package:untitled9/core/use_case/use_case.dart';

import 'package:untitled9/src/feature/auth_page/domain/repository/firebase_repository.dart';

@injectable
class SendVerificationMailFirebase implements UseCase<bool, NoParams> {
  final FirebaseRepository firebaseRepository;
  SendVerificationMailFirebase({
    required this.firebaseRepository,
  });
  @override
  Future<Either<Failure, bool>> call(NoParams noParams) async {
    return await firebaseRepository.verificationMail();
  }
}
