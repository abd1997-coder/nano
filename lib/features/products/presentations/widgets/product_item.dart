import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nano_health/core/const/app_assets.dart';
import 'package:nano_health/core/const/app_colors.dart';
import 'package:nano_health/features/products/domain/entities/product_entity.dart';

class ProductItem extends StatelessWidget {
   ProductItem({super.key , required this.productEntity});
  ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
      child: Column(
        children: [
          Container(
            alignment: AlignmentDirectional.bottomStart,
            padding: EdgeInsets.all(10.w),
            width: ScreenUtil().setWidth(370),
            height: ScreenUtil().setHeight(247),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.h)),
                image:  DecorationImage(
                    image: NetworkImage(productEntity.image), fit: BoxFit.cover)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${productEntity.price} AED",
                  style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 27.sp,
                      fontWeight: FontWeight.w700),
                ),
                RatingBar.builder(
                  initialRating: double.parse(productEntity.rating!.rate.toString()),
                  minRating: 1,
                  itemSize: ScreenUtil().setWidth(20),
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  ignoreGestures: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(18),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(370),
            child:  Text(
              "${productEntity.title}",
              style: const TextStyle(
                  fontStyle: FontStyle.italic, color: Color(0xff444B51)),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(5),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(370),
            height: ScreenUtil().setWidth(65),
            child:  Text(
              "${productEntity.description}",
              style: const TextStyle(color: Color(0xff08293B)),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(3),
          ),
          SizedBox(
              width: ScreenUtil().setWidth(362),
              child: Divider(
                height: ScreenUtil().setHeight(1),
                color: const Color(0xffD8D8D8),
              ))
        ],
      ),
    );
  }
}
