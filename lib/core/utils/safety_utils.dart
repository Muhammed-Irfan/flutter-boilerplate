import 'package:flutter_starter/core/error/exceptions.dart';
import 'package:flutter_starter/core/types/result.dart';
import 'package:fpdart/fpdart.dart';
import 'package:retrofit/retrofit.dart';

Future<Result<T>> executeSafely<T>(Future<T> Function() action, {void Function()? finallyAction}) async {
  try {
    final result = await action();
    return Right(result);
  } catch (e, s) {
    return Left(AppException.fromException(e, stackTrace: s));
  } finally {
    finallyAction?.call();
  }
}

Future<Result<T>> executeSafelyAndRetrieveResponseData<T>(
  Future<HttpResponse<T>> Function() action,
) async {
  try {
    final result = await action();
    return Right(result.data);
  } catch (e, s) {
    return Left(AppException.fromException(e, stackTrace: s));
  }
}

Future<Result<R>> executeSafelyWithMapping<T, R>(
  Future<Result<T>> Function() action,
  R Function(T) mapper,
) async {
  try {
    final result = await action();
    return result.map(mapper);
  } catch (e, s) {
    return Left(AppException.fromException(e, stackTrace: s));
  }
}
