import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learn/common/values/colors.dart';
import 'package:u_learn/common/widgets/base_text_widget.dart';
import 'package:u_learn/pages/course/course_detail/bloc/course_detail_blocs.dart';
import 'package:u_learn/pages/course/course_detail/bloc/course_detail_states.dart';
import 'package:u_learn/pages/course/course_detail/course_detail_controller.dart';
import 'package:u_learn/pages/course/widgets/course_details_widgets.dart';

import '../../../common/values/constants.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  // late var id;

  late CourseDetailController _courseDetailController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  /// same as on ready method in getx
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _courseDetailController = CourseDetailController(context: context);
    _courseDetailController.init();
    super.didChangeDependencies();

    // id = ModalRoute.of(context)!.settings.arguments as Map;
    // print("-------> CourseDetail ${id.values}");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailBlocs, CourseDetailStates>(
        builder: (context, state){
          /**
           * Build method is called before the state is ready, this will cause crushing error since we
           * will be referencing/calling data that is not ready yet.
           * To prevent this error of referencing unready state error, we first check whether state.courseItem is null or not
           */
          return state.courseItem==null ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue ,
            ),
          ):Container(
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
                            thumbNail("${state.courseItem!.thumbnail}"),

                            SizedBox(height:15.h),

                            ///three menu
                            menuView(),

                            SizedBox(height: 15.h,),

                            /// course description title
                            reusableText("Course Description"),

                            SizedBox(height: 15.h,),

                            /// course description
                            descriptionText("${state.courseItem!.description}"),

                            SizedBox(height: 15.h,),

                            /// course buy button
                            GestureDetector(
                              onTap: (){
                                _courseDetailController.goBuy(state.courseItem!.id);
                              },
                                child: goBuyButton("Go Buy")
                            ),

                            SizedBox(height: 15.h,),

                            /// course summary
                            courseSummaryTitle(),

                            SizedBox(height: 15.h,),

                            /// Course Summary in List
                            courseSummaryView(context, state),

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
    );
  }
}
