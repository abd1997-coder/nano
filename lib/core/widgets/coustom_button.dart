import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nano_health/core/const/app_colors.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key , required this.onClick});
  final Function onClick;
  @override
  State<CustomButton> createState() => _CustomStateButton();
}

class _CustomStateButton extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.onClick();
      },
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.secondaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ScreenUtil().setHeight(62)),
          ))),
      child: Text(
        "Continue",
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17.sp),
      ),
    );
  }
}
