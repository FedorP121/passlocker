import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled9/core/error_jurnal/error_jurnal.dart';
import 'package:untitled9/core/use_case/use_case.dart';
import 'package:untitled9/src/feature/category_page/domain/entities/password_model.dart';
import 'package:untitled9/src/feature/category_page/domain/repository/realtime_database_repository.dart';

@injectable
class WriteNewPasswordFirebase implements UseCase<bool, PasswordModel> {
  final RealtimeDatabaseRepository realtimeDatabaseRepository;
  WriteNewPasswordFirebase({
    required this.realtimeDatabaseRepository,
  });
  @override
  Future<Either<Failure, bool>> call(PasswordModel passwordModel) async {
    return await realtimeDatabaseRepository.writeNewPassword(passwordModel);
  }
}
