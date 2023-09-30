import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learn/common/apis/course_api.dart';
import 'package:u_learn/common/entities/entities.dart';
import 'package:u_learn/pages/home/bloc/home_page_blocs.dart';
import 'package:u_learn/pages/home/bloc/home_page_events.dart';

import '../../global.dart';
class HomeController{

  late BuildContext context;

  UserItem? get userProfile => Global.storageService.getUserProfile();


  /**
   * SINGLETON - There is only instance of this class, the class can also be called from anywhere. we don't need to create another instance
   */
  static final HomeController _singleton =HomeController._external(); /// This is a private constructor
  HomeController._external();

  /// factory constructor makes sure that you have the only one created instance i.e. _singleton instance
  factory HomeController({required BuildContext context}){
    _singleton.context = context; /// initialize BuildContext context
    return _singleton;
  }


  Future<void> init() async {
    /**
     * Since we are using singleton, this will improve app efficiency and reduce network calls made made to the server.
     */
    /// Make sure the user is logged in and make the api call.
    if(Global.storageService.getUserToken().isNotEmpty){
      print("----------> [HomeController] init()");
      var result = await CourseAPI.courseList();
      if(result.code == 200){
        if(context.mounted){
          context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
        }
        print("Perfect !!!");
        print("${result.data![0].name}");
      }
      else{
        print(" ERROR: ${result.code}");
      }
    }
    else{
      print("user has already logged out");
    }
  }
}