import 'package:flutter/material.dart';
import 'package:nano_health/core/const/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  // text styles
  static TextStyle loginWordStyle = TextStyle(
      color: AppColors.whiteColor,
      fontSize: 34.sp,
      fontFamily: "SFProDisplay",
      fontWeight: FontWeight.w700);

  static TextStyle needHelpStyle =
      TextStyle(color: Colors.black, fontSize: 15.sp);

        static TextStyle labelStyle =
      TextStyle(
              fontSize: 13.sp,
              color: Colors.black
            );
  // Gradient
  static BoxDecoration loginGradient() {
    return const BoxDecoration(
      gradient: LinearGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.secondaryColor,
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp),
    );
  }
}
