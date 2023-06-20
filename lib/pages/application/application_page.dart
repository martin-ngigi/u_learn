import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learn/common/values/colors.dart';
import 'package:u_learn/pages/application/widgets/application_widgets.dart';

class ApplicationPage extends StatefulWidget {

  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: buildPage(_index),
        bottomNavigationBar: Container(
          width: 375.w,
          height: 80.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.h),
              topRight: Radius.circular(20.h),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1
              )
            ]
          ),
          child: BottomNavigationBar(
            onTap: (value){
              setState((){
                _index = value;
              });
              //print("---------> [ApplicationPage] tapped page index: $_index");

            },
            elevation: 0,
            currentIndex: _index,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.primaryElement,
            unselectedItemColor: AppColors.primaryFourthElementText,
            items: [
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
            ],
          ),
        ),
      ),
    );
  }
}
