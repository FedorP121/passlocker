import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled9/core/error_jurnal/error_jurnal.dart';
import 'package:untitled9/core/use_case/use_case.dart';
import 'package:untitled9/src/feature/category_page/domain/entities/category_model.dart';

import 'package:untitled9/src/feature/category_page/domain/repository/realtime_database_repository.dart';

@injectable
class WriteNewCategoryFirebase implements UseCase<bool, CategoryModel> {
  final RealtimeDatabaseRepository realtimeDatabaseRepository;
  WriteNewCategoryFirebase({
    required this.realtimeDatabaseRepository,
  });
  @override
  Future<Either<Failure, bool>> call(CategoryModel categoryModel) async {
    return await realtimeDatabaseRepository.writeNewCategory(categoryModel);
  }
}
