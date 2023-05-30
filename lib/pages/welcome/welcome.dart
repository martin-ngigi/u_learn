
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learn/main.dart';
import 'package:u_learn/pages/welcome/bloc/welcome_blocs.dart';
import 'package:u_learn/pages/welcome/bloc/welcome_events.dart';
import 'package:u_learn/pages/welcome/bloc/welcome_states.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
            builder: (context, state){
              return Container(
                margin: EdgeInsets.only(top: 34.h),
                width: 375.w, /// responsiveness for mobile devices only
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    /// PageView will enable horizontal scroll
                    PageView(
                      controller: pageController,
                      onPageChanged: (index){
                        ///assign page index
                        state.page = index;
                        BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent()); /// this will update

                        //print("Current page index: ${index}");
                      },
                      children: [
                        /// first page
                        _page(
                            1,
                            context,
                            "next",
                            "First see Learning",
                            "fForget about a for of paper all knowledge in on learning",
                            "assets/images/reading.png"
                        ),

                        _page(
                            2,
                            context,
                            "next",
                            "Connect with every one",
                            "Always keep in touch with your & friend. Let's get connected",
                            "assets/images/boy.png"
                        ),

                        _page(
                            3,
                            context,
                            "next",
                            "Always fascinated Learning",
                            "Anywhere, anytime. The time is at our discrition so study whenever",
                            "assets/images/man.png"
                        ),
                      ],
                    ),

                    Positioned(
                        bottom: 100.h,
                        child: DotsIndicator(
                          position: state.page,
                          dotsCount: 3,
                          mainAxisAlignment: MainAxisAlignment.center,
                          decorator: DotsDecorator(
                              color: Colors.grey,
                              activeColor: Colors.blue,
                              size: const Size.square(8.0),
                              activeSize: const Size(20, 8),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)
                              )
                          ),
                        )
                    )
                  ],
                ),
              );
            }
        ),
      ),
    );
  }

  Widget _page(int index,
      BuildContext context,
      String buttonName, String title,
      String subTitle,
      String imagePath){
    return Column(
      children: [
        ///  image
        SizedBox(
          width: 345.w,
          height: 345.w,
          child:Image.asset(
              imagePath,
            fit: BoxFit.cover,
          ),
        ),

        /// text
        Container(
          child: Text(
            "$title",
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal
            ),
          ),
        ),

        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            "$subTitle",
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.normal
            ),
          ),
        ),

        GestureDetector(
          onTap: (){
            /// within 0 -2 index
            if(index<3){
              ///animation
              pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.decelerate
              );
            }
            else{
              /// jump to a new page
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage(title: title)));
              Navigator.of(context).pushNamedAndRemoveUntil("myHomePage", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 375.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 6,
                      offset: Offset(0, 1)
                  )
                ]
            ),
            child: Center(
              child: Text(
                "$buttonName",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
