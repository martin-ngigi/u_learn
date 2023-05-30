import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learn/pages/sign_in/widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            /// app bar
            appBar: buildAppBar(),

            /// body
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// google, apple, facebook login
                  buildThirdPartyLogin(context),

                  ///
                  Center(child: reusableText("Or use your email to login.")),

                  Container(
                    margin: EdgeInsets.only(top: 66.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w), //
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Email"),
                        SizedBox(height: 5.h,),
                        buildTextField("Enter your email address", "email", "user"),
                        reusableText("Password"),
                        SizedBox(height: 5.h,),
                        buildTextField("Enter your password", "password", "lock"),

                        forgotPassword(),
                        buildLoginAndRegButton("Login", "login"),
                        SizedBox(height: 5.h,),
                        buildLoginAndRegButton("Register", "register"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
