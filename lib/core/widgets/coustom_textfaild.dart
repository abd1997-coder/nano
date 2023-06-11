import 'package:flutter/material.dart';
import 'package:nano_health/core/const/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nano_health/core/const/app_styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.label,
      required this.suffixIcon,
      required this.obscureText,
      required this.onChange,
      required this.textInputType});
  final String label;
  final Widget suffixIcon;
  final TextInputType textInputType;
  final bool obscureText;
  final Function (String)onChange;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(342),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: AppStyles.labelStyle,
          ),
          TextField(
            obscureText: widget.obscureText,
            keyboardType: widget.textInputType,
            onChanged: widget.onChange,
            decoration: InputDecoration(
              suffixIcon: widget.suffixIcon,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.grayColor),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.grayColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
