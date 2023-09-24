import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learn/common/entities/course.dart';
import 'package:u_learn/common/values/colors.dart';
import 'package:u_learn/common/values/constants.dart';
import 'package:u_learn/pages/home/bloc/home_page_blocs.dart';
import 'package:u_learn/pages/home/bloc/home_page_events.dart';
import 'package:u_learn/pages/home/bloc/home_page_states.dart';

import '../../../common/widgets/base_text_widget.dart';

AppBar buildAppBar( String avatar) {
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
                      image: NetworkImage("${AppConstants.SERVER_API_URL}${avatar}"))),
            ),
          )
        ],
      ),
    ),
  );
}

/// reusable big text widget
Widget homePageText(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style:
          TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget searchView() {
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

/// for slider view
Widget sliderView(BuildContext context, HomePageStates state) {
  return Column(
    children: [

      /// images
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value){
            // print("------> [sliderView] Value ${value}");
            context.read<HomePageBlocs>().add(HomePageDots(value));
          },
          children: [
            _slidersContainer(path: "assets/icons/art.png"),
            _slidersContainer(path: "assets/icons/image_1.png"),
            _slidersContainer(path: "assets/icons/image_2.png"),
          ],
        ),
      ),

      ///dots
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
            color: AppColors.primaryThirdElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(5),
            activeSize: const Size(17, 5),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
            )
          ),
        ),
      )
    ],
  );
}

///sliders widget
Widget _slidersContainer({String path ="assets/icons/options.png"}){
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.h)),
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(path)
        )
    ),
  );
}

/// menu view for showing items:
Widget menuView(){
  return Column(
    children: [
      /// Chose your course
      Container(
      width: 325.w,
      margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            reusableText("Choose your course", fontSize: 16),

            /// see all
            GestureDetector(
                onTap: (){},
                child: reusableText("See all", color: AppColors.primaryThirdElementText, fontSize: 10)
            ),
          ],
        ),
      ),

      Container(
        margin: EdgeInsets.only(top: 20.w),
        child: Row(
          children: [
            _reusableMenuText("All"),
            _reusableMenuText("Popular", textColor: AppColors.primaryThirdElementText, backgroundColor: Colors.white),
            _reusableMenuText("Newest", textColor: AppColors.primaryThirdElementText, backgroundColor: Colors.white),
          ],
        ),
      )

    ],
  );
}


/// for the menu buttons reusable text
Widget _reusableMenuText(String menuText, {Color textColor = AppColors.primaryElementText, Color backgroundColor = AppColors.primaryElement}){
  return   Container(
    margin: EdgeInsets.only(right: 20.w),
    decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(7.w),
        border: Border.all(
            color: AppColors.primaryElement
        )
    ),
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
    child: reusableText(
        menuText,
        color: textColor,
        fontWeight: FontWeight.normal,
        fontSize: 11
    ),
  );
}

/// for course grid ui widget
Widget courseGrid(CourseItem courseItem){
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      /// color: Colors.green,
        borderRadius: BorderRadius.circular(15.w),
        image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage("${AppConstants.SERVER_UPLOADS}${courseItem!.thumbnail!}")
        )
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${courseItem.name}",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          softWrap: false, /// we wont have second line.
          style: TextStyle(
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.bold,
              fontSize: 11.sp
          ),
        ),
        SizedBox(height: 5.h,),
        Text(
          "${courseItem.description}",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          softWrap: false, /// we wont have second line.
          style: TextStyle(
              color: AppColors.primaryFourthElementText,
              fontWeight: FontWeight.normal,
              fontSize: 8.sp
          ),
        ),
      ],
    ),
  );
}