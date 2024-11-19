import 'package:flutter_starter/core/error/exceptions.dart';
import 'package:fpdart/fpdart.dart';

Future<Either<AppException, T>> executeSafely<T>(Future<T> Function() action) async {
  try {
    final result = await action();
    return Right(result);
  } catch (e, s) {
    return Left(e is AppException ? e : AppException(message: e.toString(), stackTrace: s));
  }
}
