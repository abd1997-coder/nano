import 'package:dartz/dartz.dart';
import 'package:nano_health/core/error/failures.dart';
import 'package:nano_health/features/products/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}
