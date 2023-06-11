import 'package:dartz/dartz.dart';
import 'package:nano_health/core/error/exceptions.dart';
import 'package:nano_health/core/error/failures.dart';
import 'package:nano_health/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:nano_health/features/auth/domain/entities/login_entity.dart';
import 'package:nano_health/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{

  final AuthRemoteDataSource authRemoteDataSourceImpl;
  AuthRepositoryImpl({required this.authRemoteDataSourceImpl});
  @override
  Future<Either<Failure, LoginEntity>> login(String username , String password) async{
   try {
      final remotePosts = await authRemoteDataSourceImpl.login(username  , password);
      return Right(remotePosts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}