import 'package:flutter_starter/core/error/exceptions.dart';
import 'package:fpdart/fpdart.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppException, Type>> call(Params params);
}

class NoParams {
  const NoParams();
}
