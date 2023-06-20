import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learn/pages/register/bloc/register_bloc.dart';
import 'package:u_learn/pages/register/bloc/register_events.dart';
import 'package:u_learn/pages/register/bloc/register_states.dart';
import 'package:u_learn/pages/register/register_controller.dart';

import '../common_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterStates>(builder: (context, state){
      return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,

              /// app bar
              appBar: buildAppBar("Sign Up"),

              /// body
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h,),

                    ///
                    Center(child: reusableText("Enter your details below and free sign up.")),

                    Container(
                      margin: EdgeInsets.only(top: 36.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w), //
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// User name
                          reusableText("User name"),
                          buildTextField(
                            "Enter your user name",
                            "name",
                            "user",
                                (value) {
                               context.read<RegisterBlocs>().add(UserNameEvent(value));
                            },
                          ),

                          /// Email
                          reusableText("Email"),
                          buildTextField(
                            "Enter your email address",
                            "email",
                            "user",
                                (value) {
                                  context.read<RegisterBlocs>().add(EmailEvent(value));
                            },
                          ),

                          /// Password
                          reusableText("Password"),
                          buildTextField(
                            "Enter your password",
                            "password",
                            "lock",
                                (value) {
                                  context.read<RegisterBlocs>().add(PasswordEvent(value));
                            },
                          ),

                          /// Password
                          reusableText("Re-enter your password"),
                          buildTextField(
                            "Re-enter your password to confirm",
                            "password",
                            "lock",
                                (value) {
                                  context.read<RegisterBlocs>().add(RePasswordEvent(value));
                            },
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 25.w),
                            child: reusableText("Enter"),
                          ),

                          SizedBox(
                            height: 5.h,
                          ),
                          buildLoginAndRegButton("Sign Up", "login", () {
                            /// handle register logic
                            RegisterController(context: context).handleEmailRegister();
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
