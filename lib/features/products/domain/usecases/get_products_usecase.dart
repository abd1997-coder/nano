import 'package:dartz/dartz.dart';
import 'package:nano_health/core/error/failures.dart';
import 'package:nano_health/features/products/domain/entities/product_entity.dart';
import 'package:nano_health/features/products/domain/repositories/product_repository.dart';

class GetProductsUseCase{
  final ProductRepository repository;
  GetProductsUseCase({required this.repository});

  Future<Either<Failure, List<ProductEntity>>> call() async {
    return await repository.getProducts();
  }
}