import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled9/core/error_jurnal/error_jurnal.dart';
import 'package:untitled9/core/use_case/use_case_stream.dart';
import 'package:untitled9/src/feature/category_page/domain/entities/password_model.dart';
import 'package:untitled9/src/feature/category_page/domain/repository/realtime_database_repository.dart';

@injectable
class ListenDataFirebase implements UseCaseStream<List<PasswordModel>, String> {
  final RealtimeDatabaseRepository realtimeDatabaseRepository;
  ListenDataFirebase({
    required this.realtimeDatabaseRepository,
  });
  @override
  Stream<Either<Failure, List<PasswordModel>>> call(String userId) {
    return realtimeDatabaseRepository.listenData(userId);
  }
}
