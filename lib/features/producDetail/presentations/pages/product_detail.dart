import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nano_health/core/const/app_assets.dart';
import 'package:nano_health/core/const/app_colors.dart';
import 'package:nano_health/core/widgets/coustom_button.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  double height = ScreenUtil().setHeight(300);

  bool isOpen = false;
  onClick() {
    if (isOpen) {
      height = ScreenUtil().setHeight(340) - 40;
    } else {
      height = ScreenUtil().setHeight(340);
    }
    isOpen = !isOpen;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: ScreenUtil().setWidth(414),
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(AppAssets.detail))),
            child: Column(
              children: [
                SizedBox(
                  height: ScreenUtil().setHeight(80),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(9)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.sp))),
                          width: ScreenUtil().setWidth(40),
                          height: ScreenUtil().setWidth(40),
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.sp))),
                        width: ScreenUtil().setWidth(40),
                        height: ScreenUtil().setWidth(40),
                        child: const Icon(Icons.more_vert_rounded),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(15),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(9)),
                  child: Text(
                    "Detail",
                    style: TextStyle(
                        fontSize: 28.sp,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
          AnimatedPositioned(
            top: isOpen
                ? ScreenUtil().setHeight(520)
                : ScreenUtil().setHeight(650),
            duration: const Duration(seconds: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: ScreenUtil().setWidth(414),
                  margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(34)),
                  child: Text(
                    "0000 AED",
                    style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff2A404B)),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  width: ScreenUtil().setWidth(414),
                  height: height,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(ScreenUtil().setHeight(35)),
                          topRight:
                              Radius.circular(ScreenUtil().setHeight(35)))),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          onClick();
                        },
                        child: Container(
                          width: ScreenUtil().setWidth(12),
                          height: ScreenUtil().setHeight(12),
                          child: Image.asset(
                              isOpen ? AppAssets.shapeDown : AppAssets.shapeUp),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(ScreenUtil().setWidth(14)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: ScreenUtil().setWidth(56),
                              height: ScreenUtil().setWidth(56),
                              child: Image.asset(AppAssets.shareButton),
                            ),
                            SizedBox(
                                width: ScreenUtil().setWidth(279),
                                height: ScreenUtil().setWidth(54),
                                child: CustomButton(onClick: () {}))
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(20)),
                        child: Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xff444B51),
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.all(ScreenUtil().setWidth(20)),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xff444B51),
                          ),
                        ),
                      ),
                      AnimatedSwitcher(
                          duration: const Duration(seconds: 2),
                          child: !isOpen
                              ? const SizedBox()
                              : Container(
                                  width: ScreenUtil().setWidth(373),
                                  height: ScreenUtil().setHeight(98),
                                  decoration: BoxDecoration(
                                      color: const Color(0xffF1F1F1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              ScreenUtil().setWidth(20)))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(
                                            ScreenUtil().setWidth(6)),
                                        child: const Text(
                                          "Reviews (100)",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(
                                            ScreenUtil().setWidth(12)),
                                        child: Row(
                                          children: [
                                            Text(
                                              "4.33",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                  fontSize: 32.sp),
                                            ),
                                            SizedBox(
                                              width: ScreenUtil().setWidth(30),
                                            ),
                                            RatingBar.builder(
                                              initialRating: 4.5,
                                              minRating: 1,
                                              itemSize:
                                                  ScreenUtil().setWidth(25),
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
