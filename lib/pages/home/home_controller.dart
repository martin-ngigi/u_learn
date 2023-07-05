import 'package:flutter/material.dart';
import 'package:u_learn/common/entities/entities.dart';

import '../../global.dart';
class HomeController{

  final BuildContext context;
  HomeController({required this.context});
  UserItem? userProfile = Global.storageService.getUserProfile();

  void init(){
    print("----------> [HomeController] init()");
  }
}