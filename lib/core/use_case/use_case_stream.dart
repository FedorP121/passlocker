import 'package:dartz/dartz.dart';
import 'package:untitled9/core/error_jurnal/error_jurnal.dart';

abstract class UseCaseStream<Type, Params> {
  Stream<Either<Failure, Type>> call(Params params);
}
