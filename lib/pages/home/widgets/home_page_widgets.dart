import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learn/common/values/colors.dart';

AppBar buildAppBar(){
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/icons/person.png")
                )
              ),
            ),
          )
        ],
      ),
    ),
  );
}

/// reusable big text widget
Widget homePageText(String text, {Color color=AppColors.primaryText, int top=20 }){
  return Container(
    margin: EdgeInsets.only(
        top: top.h
    ),
    child: Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: 24.sp,
          fontWeight: FontWeight.bold
      ),
    ),
  );
}

Widget searchView(){
  return Row(
    children: [
      /// search feilds
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.h),
          border: Border.all(color: AppColors.primaryFourthElementText)
        ),
        child: Row(
          children: [

            /// search icon
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.w,
              child: Image.asset("assets/icons/search.png"),
            ),

            /// search textfeild
            Container(
              width: 240.w,
              height: 40.h,
              child:  TextField(
                onChanged: (value){

                },
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5), /// center align hint text
                  hintText: "Search for course",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  hintStyle: TextStyle(color:AppColors.primarySecondaryElementText),
                ),
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp),
                autocorrect: false,
                obscureText:  false,
              ),
            )

          ],
        ),
      ),

      /// icon
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.circular(13.w),
            border: Border.all(color: AppColors.primaryElement)
          ),
          child: Image.asset("assets/icons/options.png"),
        ),
      )
    ],
  );
}