import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// app bar
AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1),
      child: Container(
        color: Colors.grey.withOpacity(0.5),

        /// height define the thickness of the line.
        height: 1,
      ),
    ),
    title: Text(
      "Login",
      style: TextStyle(
          color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.normal),
    ),
  );
}

/// We need context for accessing bloc
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(
      top: 40.h,
      bottom: 20.h,
      left: 50.w,
      right: 50.w,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcons("google"),
        _reusableIcons("apple"),
        _reusableIcons("facebook"),
      ],
    ),
  );
}

Widget _reusableIcons(
  String iconName,
) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 40.w,
      height: 40.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.grey.withOpacity(0.7),
          fontWeight: FontWeight.normal,
          fontSize: 14.sp),
    ),
  );
}

Widget buildTextField(String hintText, String textType, String iconName) {
  return Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
          // color: Colors.grey[100],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.w)),
          border: Border.all(color: Colors.black)),
      child: Row(
        children: [
          /// icon
          Container(
            width: 16.w,
            height: 16.w,
            margin: EdgeInsets.only(left: 17.w),
            child: Image.asset("assets/icons/$iconName.png"),
          ),

          /// textfield
          Container(
            width: 270.w,
            height: 50.h,
            child: TextField(
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: "$hintText",
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
              ),
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp),
              autocorrect: false,
              obscureText: textType == "password" ? true : false,
            ),
          )
        ],
      ));
}

Widget forgotPassword() {
  return Container(
    width: 260.w,
    height: 44.h,
    margin: EdgeInsets.only(
      left: 20.w,
    ),
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forgot password ?",
        style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue,
            fontSize: 12.sp),
      ),
    ),
  );
}

Widget buildLoginAndRegButton(String buttonName, String buttonType) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(left: 25.w, right: 25.w, top: buttonType == "login" ? 10.h : 5.h),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15.w),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 2,
              color: Colors.grey.withOpacity(0.4),
            )
          ]),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: Colors.white
          ),
        ),
      ),
    ),
  );
}