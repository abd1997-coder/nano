import 'package:dartz/dartz.dart';
import 'package:nano_health/core/error/exceptions.dart';
import 'package:nano_health/core/error/failures.dart';
import 'package:nano_health/features/products/data/datasources/products_remote_data_source.dart';
import 'package:nano_health/features/products/domain/entities/product_entity.dart';
import 'package:nano_health/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRemoteDataSource remoteDataSource;
  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final remotePosts = await remoteDataSource.getProducts();
      return Right(remotePosts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
