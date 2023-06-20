import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learn/common/routes/routes.dart';
import 'package:u_learn/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:u_learn/pages/sign_in/bloc/sign_in_events.dart';
import 'package:u_learn/pages/sign_in/bloc/sign_in_states.dart';
import 'package:u_learn/pages/sign_in/sign_in_controller.dart';
import '../common_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,

          /// app bar
          appBar: buildAppBar("Login"),

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
                  margin: EdgeInsets.only(top: 36.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w), //
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("Email"),
                      SizedBox(
                        height: 5.h,
                      ),
                      buildTextField(
                        "Enter your email address",
                        "email",
                        "user",
                        (value) {
                          context.read<SignInBloc>().add(EmailEvent(value));
                        },
                      ),
                      reusableText("Password"),
                      SizedBox(
                        height: 5.h,
                      ),
                      buildTextField(
                        "Enter your password",
                        "password",
                        "lock",
                        (value) {
                          context.read<SignInBloc>().add(PasswordEvent(value));
                        },
                      ),
                      forgotPassword(),
                      buildLoginAndRegButton("Login", "login", () {
                        /// login logic
                        SignInController(context: context).handleSignIn("email");
                      }),
                      SizedBox(
                        height: 5.h,
                      ),
                      buildLoginAndRegButton("Sign Up", "register", () {
                        /// navigate to register page
                        Navigator.of(context).pushNamed("/register");
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
      );
    });
  }
}
