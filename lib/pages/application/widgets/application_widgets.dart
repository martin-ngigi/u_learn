import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learn/pages/home/home_page.dart';

import '../../../common/values/colors.dart';

Widget buildPage(int index){
  List<Widget> _widgets = [
    // Center(
    //   child: Text("Home"),
    // ),
    const HomePage(),

    Center(
      child: Text("Search"),
    ),
    Center(
      child: Text("Course"),
    ),
    Center(
      child: Text("Chat"),
    ),
    Center(
      child: Text("Profile"),
    )
  ];

  return _widgets[index];
}

var bottomTabs =[
  /// home
  BottomNavigationBarItem(
      label: "Home",
      backgroundColor: Colors.grey,
      activeIcon: SizedBox(
        child: Image.asset(
          width: 15.w,
          height: 15.h,
          "assets/icons/home.png",
          color: AppColors.primaryElement,
        ),
      ) ,
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
            "assets/icons/home.png"
        ),
      )
  ),

  ///search
  BottomNavigationBarItem(
      label: "Search",
      backgroundColor: Colors.grey,
      activeIcon: SizedBox(
        child: Image.asset(
          width: 15.w,
          height: 15.h,
          "assets/icons/search2.png",
          color: AppColors.primaryElement,
        ),
      ) ,
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
            "assets/icons/search2.png"
        ),
      )
  ),

  /// Course
  BottomNavigationBarItem(
      label: "Course",
      backgroundColor: Colors.grey,
      activeIcon: SizedBox(
        child: Image.asset(
          width: 15.w,
          height: 15.h,
          "assets/icons/play-circle1.png",
          color: AppColors.primaryElement,
        ),
      ) ,
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/play-circle1.png",
        ),
      )
  ),

  /// Chat
  BottomNavigationBarItem(
      label: "Chat",
      backgroundColor: Colors.grey,
      activeIcon: SizedBox(
        child: Image.asset(
          width: 15.w,
          height: 15.h,
          "assets/icons/message-circle.png",
          color: AppColors.primaryElement,
        ),
      ) ,
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/message-circle.png",
        ),
      )
  ),

  /// Profile
  BottomNavigationBarItem(
      label: "Profile",
      backgroundColor: Colors.grey,
      activeIcon: SizedBox(
        child: Image.asset(
          width: 15.w,
          height: 15.h,
          "assets/icons/person2.png",
          color: AppColors.primaryElement,
        ),
      ) ,
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/person2.png",
        ),
      )
  ),
];