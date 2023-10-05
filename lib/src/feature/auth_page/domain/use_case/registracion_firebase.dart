import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled9/core/error_jurnal/error_jurnal.dart';
import 'package:untitled9/core/use_case/use_case.dart';
import 'package:untitled9/src/feature/auth_page/domain/entities/registration_details.dart';
import 'package:untitled9/src/feature/auth_page/domain/repository/firebase_repository.dart';

@injectable
class RegistracionNewFirebaseAcount
    implements UseCase<String, RegistrationDetails> {
  final FirebaseRepository firebaseRepository;
  RegistracionNewFirebaseAcount({
    required this.firebaseRepository,
  });
  @override
  Future<Either<Failure, String>> call(RegistrationDetails details) async {
    return await firebaseRepository.onRegister(details);
  }
}
