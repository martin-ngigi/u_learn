import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learn/common/apis/course_api.dart';
import 'package:u_learn/common/entities/course.dart';
import 'package:u_learn/common/widgets/flutter_toast.dart';
import 'package:u_learn/pages/course/course_detail/bloc/course_detail_blocs.dart';

import 'bloc/course_detail_events.dart';

class CourseDetailController{
  final BuildContext context;
  
  CourseDetailController({required this.context});
  
  void init() async{
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    print("-----------> CourseController init() ${args['id']}");

   await asyncLoadAllData(args['id']);
  }

  Future asyncLoadAllData(int? id) async{
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;

    var result = await CourseAPI.courseDetail(params: courseRequestEntity);
    if(result.code == 200){
      if(context.mounted){

        context.read<CourseDetailBlocs>().add(TriggerCourseDetail(result.data!));
        toastInfo(msg: "Yeeesy ${result.data!.description}");

      }
      else{
        print("------>Error: Context is not mounted");
      }
    }
    else{
      toastInfo(msg: "Something went wrong");
      print("--------- Error code : ${result.code}");
    }
  }
}