import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nano_health/core/const/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nano_health/features/producDetail/presentations/pages/product_detail.dart';
import 'package:nano_health/features/products/presentations/cubit/products_cubit.dart';
import 'package:nano_health/features/products/presentations/widgets/product_item.dart';
import 'package:nano_health/injection_container.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    sl<ProductsCubit>().getProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70), // Set this height
          child: Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(22)),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.grayColor,
                    blurRadius: 10,
                    offset: Offset(1, 1), // Shadow position
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(35.h))),
            child: Text(
              'All Products',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28.sp),
            ),
          ),
        ),
        body: BlocBuilder<ProductsCubit, ProductsState>(
          bloc: sl<ProductsCubit>(),
          builder: (context, state) {
            if (state is ProductsLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.secondaryColor,
                ),
              );
            }
            if (state is ProductsSuccess) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProductDetail()),
                      );
                    },
                    child: ProductItem(productEntity: state.products[index]),
                  );
                },
              );
            } else {
              return Center(
                child: Text("Error 502"),
              );
            }
          },
        ));
  }
}
