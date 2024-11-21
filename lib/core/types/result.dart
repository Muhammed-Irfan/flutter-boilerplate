import 'package:flutter_starter/core/error/exceptions.dart';
import 'package:fpdart/fpdart.dart';

/// Type alias for Either with AppException as the left type
typedef Result<T> = Either<AppException, T>;
