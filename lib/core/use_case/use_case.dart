import 'package:dartz/dartz.dart';
import 'package:untitled9/core/error_jurnal/error_jurnal.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
