import 'package:flutter_starter/core/services/auth/token_service.dart';
import 'package:flutter_starter/core/types/result.dart';
import 'package:flutter_starter/core/usecases/usecase.dart';
import 'package:flutter_starter/core/utils/safety_utils.dart';
import 'package:flutter_starter/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class Logout implements UseCase<void, NoParams> {
  final AuthRepository _authRepository;
  final TokenService _tokenService;

  Logout(this._tokenService, this._authRepository);

  @override
  Future<Result<void>> call(NoParams params) => executeSafely(() async {
        await Future.wait([_authRepository.logout(), _tokenService.deleteTokens()]);
      });
}
