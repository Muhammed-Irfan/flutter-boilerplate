import 'package:flutter_starter/core/error/exceptions.dart';
import 'package:fpdart/fpdart.dart';
import 'package:retrofit/retrofit.dart';

Future<Either<AppException, T>> executeSafely<T>(Future<T> Function() action) async {
  try {
    final result = await action();
    return Right(result);
  } catch (e, s) {
    return Left(AppException.fromException(e, stackTrace: s));
  }
}

Future<Either<AppException, T>> executeSafelyAndRetrieveResponseData<T>(Future<HttpResponse<T>> Function() action) async {
  try {
    final result = await action();
    return Right(result.data);
  } catch (e, s) {
    return Left(AppException.fromException(e, stackTrace: s));
  }
}

Future<Either<AppException, R>> executeSafelyWithMapping<T, R>(
  Future<Either<AppException, T>> Function() action,
  R Function(T) mapper,
) async {
  try {
    final result = await action();
    return result.map(mapper);
  } catch (e, s) {
    return Left(AppException.fromException(e, stackTrace: s));
  }
}
