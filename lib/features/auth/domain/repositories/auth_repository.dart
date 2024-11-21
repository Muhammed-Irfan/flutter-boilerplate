import 'package:flutter_starter/core/types/result.dart';

abstract class AuthRepository {
  Future<Result<void>> logout();
} 
