import 'package:get_it/get_it.dart';
import 'package:nano_health/core/network/network_info.dart';
import 'package:nano_health/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:nano_health/features/auth/data/repositories/auth_repositry_impl.dart';
import 'package:nano_health/features/auth/domain/repositories/auth_repository.dart';
import 'package:nano_health/features/auth/domain/usecases/login_usecase.dart';
import 'package:nano_health/features/auth/presentations/cubit/auth_cubit.dart';
import 'package:nano_health/features/products/data/datasources/products_remote_data_source.dart';
import 'package:nano_health/features/products/data/repositories/products_repository_impl.dart';
import 'package:nano_health/features/products/domain/repositories/product_repository.dart';
import 'package:nano_health/features/products/domain/usecases/get_products_usecase.dart';
import 'package:nano_health/features/products/presentations/cubit/products_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - products
// Bloc
  sl.registerLazySingleton(() => ProductsCubit(getProductsUseCase: sl()));
// Use cases
  sl.registerLazySingleton(() => GetProductsUseCase(repository: sl()));
// Repository
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(remoteDataSource: sl()));
// Data sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl());

// Feature -> auth
// Bloc
  sl.registerLazySingleton(() => AuthCubit(loginUseCase: sl()));
// Use cases
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
// Repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authRemoteDataSourceImpl: sl()));
// Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());

//! Core
//! External
}
