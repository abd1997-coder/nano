import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nano_health/core/const/app_assets.dart';
import 'package:nano_health/core/const/app_colors.dart';
import 'package:nano_health/core/const/app_styles.dart';
import 'package:nano_health/core/widgets/coustom_button.dart';
import 'package:nano_health/core/widgets/coustom_textfaild.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nano_health/features/auth/presentations/cubit/auth_cubit.dart';
import 'package:nano_health/features/products/presentations/pages/products_page.dart';
import 'package:nano_health/injection_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = false;
  bool isValidEmail = false;

  validateEmail(String? value) {
    if (value != null) {
      if (value.length > 5 && value.contains('@') && value.endsWith('.com')) {
        isValidEmail = true;
      } else {
        isValidEmail = false;
      }
    }
    setState(() {});
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: ScreenUtil().setWidth(414),
              height: ScreenUtil().setHeight(411),
              alignment: Alignment.center,
              decoration: AppStyles.loginGradient(),
              child: SizedBox(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtil().setHeight(100),
                  ),
                  Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: ScreenUtil().setWidth(240),
                        height: ScreenUtil().setHeight(117),
                        child: Image.asset(AppAssets.logo),
                      )),
                  SizedBox(
                    height: ScreenUtil().setHeight(100),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(32)),
                    width: double.infinity,
                    child: Text(
                      "Log In",
                      style: AppStyles.loginWordStyle,
                    ),
                  )
                ],
              )),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(54),
            ),
            CustomTextField(
              label: "Email",
              obscureText: false,
              onChange: (value) {
                validateEmail(value);
              },
              textInputType: TextInputType.emailAddress,
              suffixIcon: Icon(
                Icons.check_circle_outline,
                size: ScreenUtil().setHeight(20),
                color: isValidEmail
                    ? AppColors.secondaryColor
                    : AppColors.grayColor,
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            CustomTextField(
              label: "Password",
              obscureText: !obscureText,
              onChange: (p0) {},
              textInputType: TextInputType.visiblePassword,
              suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Icon(
                    Icons.visibility,
                    size: ScreenUtil().setHeight(20),
                    color: obscureText
                        ? AppColors.secondaryColor
                        : AppColors.grayColor,
                  )),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(14),
            ),
            SizedBox(
                width: ScreenUtil().setHeight(342),
                height: ScreenUtil().setHeight(74),
                child: BlocConsumer<AuthCubit, AuthState>(
                  bloc: sl<AuthCubit>(),
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductsPage()));
                    }
                    if (state is AuthError) {
                      // TODO
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.secondaryColor,
                        ),
                      );
                    } else {
                      return CustomButton(
                        onClick: () {
                          sl<AuthCubit>().login("mor_2314", "83r5^_");
                        },
                      );
                    }
                  },
                )),
            SizedBox(
              height: ScreenUtil().setHeight(43),
            ),
            SizedBox(
              child: Text(
                "NEED HELP?",
                style: AppStyles.needHelpStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
