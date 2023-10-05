import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled9/core/error_jurnal/error_jurnal.dart';
import 'package:untitled9/core/use_case/use_case.dart';
import 'package:untitled9/core/use_case/use_case_stream.dart';
import 'package:untitled9/src/feature/auth_page/data/models/user_details.dart';
import 'package:untitled9/src/feature/auth_page/domain/repository/firebase_repository.dart';

@injectable
class CheckUserStatus extends UseCaseStream<UserDetails, NoParams> {
  final FirebaseRepository firebaseRepository;

  CheckUserStatus(this.firebaseRepository);

  @override
  Stream<Either<Failure, UserDetails>> call(NoParams params) {
    return firebaseRepository.checkUserStatus();
  }
}
