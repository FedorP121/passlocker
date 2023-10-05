import 'package:dartz/dartz.dart';
import 'package:untitled9/core/error_jurnal/error_jurnal.dart';
import 'package:untitled9/src/feature/category_page/domain/entities/category_model.dart';
import 'package:untitled9/src/feature/category_page/domain/entities/password_model.dart';

abstract interface class RealtimeDatabaseRepository {
  Future<Either<Failure, bool>> writeNewPassword(PasswordModel details);

  Stream<Either<Failure, List<PasswordModel>>> listenData(String userId);

  Future<Either<Failure, bool>> writeNewCategory(CategoryModel category);
}
