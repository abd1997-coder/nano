import 'package:dartz/dartz.dart';
import 'package:nano_health/core/error/failures.dart';
import 'package:nano_health/features/auth/domain/entities/login_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> login(String username, String password);
}
