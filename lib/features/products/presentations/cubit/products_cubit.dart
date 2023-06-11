import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nano_health/features/products/data/models/product_model.dart';
import 'package:nano_health/features/products/domain/entities/product_entity.dart';
import 'package:nano_health/features/products/domain/usecases/get_products_usecase.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required this.getProductsUseCase}) : super(ProductsInitial());

  final GetProductsUseCase getProductsUseCase;

  getProducts() async {
    emit(ProductsLoading());
    final products = await getProductsUseCase();
    products.fold((l) {
      emit(ProductsError());
    }, (r) {
      emit(ProductsSuccess(products: r));
    });
  }
}
