import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled9/core/error_jurnal/error_jurnal.dart';
import 'package:untitled9/src/feature/category_page/data/data_source/realtime_database_service.dart';
import 'package:untitled9/src/feature/category_page/domain/entities/category_model.dart';
import 'package:untitled9/src/feature/category_page/domain/entities/password_model.dart';
import 'package:untitled9/src/feature/category_page/domain/repository/realtime_database_repository.dart';

@Injectable(as: RealtimeDatabaseRepository)
class RealtimeDatabaseRepositoryImpl implements RealtimeDatabaseRepository {
  final RealtimeDatabaseServ realtimeDatabaseServ;
  const RealtimeDatabaseRepositoryImpl({
    required this.realtimeDatabaseServ,
  });

  @override
  Stream<Either<Failure, List<PasswordModel>>> listenData(String userId) {
    return _listenData(userId);
  }

  Stream<Either<Failure, List<PasswordModel>>> _listenData(String userId) {
    final controller = StreamController<Either<Failure, List<PasswordModel>>>();

    realtimeDatabaseServ.listenData(userId).listen(
      (passwords) {
        controller.add(Right(passwords));
      },
      onError: (error) {
        controller.add(Left(ServerError(error: error.toString())));
      },
    );

    return controller.stream;
  }

  @override
  Future<Either<Failure, bool>> writeNewPassword(PasswordModel details) async {
    return await _writeNewPassword(details);
  }

  Future<Either<Failure, bool>> _writeNewPassword(PasswordModel details) async {
    try {
      final either = await realtimeDatabaseServ.writeNewPassword(details);
      return Right(either);
    } on Failure catch (e) {
      throw Left(ServerError(error: e));
    }
  }

  @override
  Future<Either<Failure, bool>> writeNewCategory(CategoryModel category) async {
    return await _writeNewCategory(category);
  }

  Future<Either<Failure, bool>> _writeNewCategory(
      CategoryModel category) async {
    try {
      final either = await realtimeDatabaseServ.writeNewCategory(category);
      return Right(either);
    } on Failure catch (e) {
      throw Left(ServerError(error: e));
    }
  }
}
