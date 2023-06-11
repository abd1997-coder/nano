import 'package:dartz/dartz.dart';
import 'package:nano_health/core/error/failures.dart';
import 'package:nano_health/features/auth/domain/entities/login_entity.dart';
import 'package:nano_health/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase({required this.repository});

  Future<Either<Failure, LoginEntity>> call(String username , String password) async {
    return await repository.login( username , password);
  }
}
