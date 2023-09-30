import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learn/common/values/colors.dart';
import 'package:u_learn/common/widgets/base_text_widget.dart';
import 'package:u_learn/pages/course/widgets/course_details_widgets.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late var id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  /// same as on ready method in getx
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    id = ModalRoute.of(context)!.settings.arguments as Map;
    print("-------> CourseDetail ${id.values}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// first big Image
                      thumbNail(),

                      SizedBox(height:15.h),

                      ///three menu
                      menuView(),

                      SizedBox(height: 15.h,),

                      /// course description title
                      reusableText("Course Description"),

                      SizedBox(height: 15.h,),

                      /// course description
                      descriptionText(),

                      SizedBox(height: 15.h,),

                      /// course buy button
                      goBuyButton("Go Buy"),

                      SizedBox(height: 15.h,),

                      /// course summary
                      courseSummaryTitle(),

                      SizedBox(height: 15.h,),

                      /// Course Summary in List
                      courseSummaryView(context),

                      SizedBox(height: 15.h,),

                      /// Lesson List title
                      reusableText("Lesson List"),

                      SizedBox(height: 15.h,),

                      courseLessonList(),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
