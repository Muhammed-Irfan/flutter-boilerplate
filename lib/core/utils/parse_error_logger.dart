import 'package:dio/dio.dart';
import 'package:flutter_starter/core/error/exceptions.dart';
import 'package:retrofit/error_logger.dart';

class CustomParseErrorLogger implements ParseErrorLogger {
  @override
  void logError(Object error, StackTrace stackTrace, RequestOptions options) {
    throw JSONParsingException(
      'Failed to parse response for ${options.path}',
      stackTrace,
    );
  }
}
