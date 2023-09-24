import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learn/common/apis/course_api.dart';
import 'package:u_learn/common/entities/entities.dart';
import 'package:u_learn/pages/home/bloc/home_page_blocs.dart';
import 'package:u_learn/pages/home/bloc/home_page_events.dart';

import '../../global.dart';
class HomeController{

  final BuildContext context;
  HomeController({required this.context});
  UserItem? userProfile = Global.storageService.getUserProfile();

  Future<void> init() async {
    print("----------> [HomeController] init()");
    var result = await CourseAPI.courseList();
    if(result.code == 200){
      context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
      print("Perfect !!!");
      print("${result.data![0].name}");
    }
    else{
      print(" ERROR: ${result.code}");
    }
  }
}