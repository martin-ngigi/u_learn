import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learn/pages/register/bloc/register_bloc.dart';
import 'package:u_learn/pages/register/register.dart';
import 'package:u_learn/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:u_learn/pages/sign_in/sign_in.dart';
import 'package:u_learn/pages/welcome/bloc/welcome_blocs.dart';
import 'package:u_learn/pages/welcome/welcome.dart';

import 'names.dart';

class AppPages {
  static List<PageEntity> routes(){
    return [
      /// Welcome
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(create: (_) => WelcomeBloc())),

      /// SignIn
      PageEntity(
          route: AppRoutes.SIGN_IN,
          page: const SignIn(),
          bloc: BlocProvider(create: (_) => SignInBloc())),

      /// Register
      PageEntity(
          route: AppRoutes.REISTER,
          page: const Register(),
          bloc: BlocProvider(create: (_) => RegisterBlocs())),

      /// Application
    /**
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        // bloc: BlocProvider(create: (_) => RegisterBlocs()
      ),
      **/
    ];
  }

  /// return all bloc providers
  static List<dynamic> allBlocProviders (BuildContext context){
    List<dynamic> blocProviders = <dynamic>[];
    for(var bloc in routes()){ /// routes() returns a list
      /// take each bloc and add it to blockproviders
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  /// a modal that covers entire screen as we click on navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings){
    if(settings.name != null){
      /// check for route name matching when navigator gets triggered
      var results = routes().where((element) => element.route == settings.name);
      if(results.isNotEmpty){
        print("--------> [AppPages] Valid route name ${settings.name}");
        return MaterialPageRoute(builder: (_) => results.first.page,settings: settings);
      }
    }

    /// else is results is empty or could not find the route, return SignIn page.
    /// if it was on web, we could have returned 404 page.
    print("----------> [AppPages] Invalid route name ${settings.name}");
    return MaterialPageRoute(builder: (_) => SignIn(), settings: settings);

  }
}



/// unify blockProvider, routes and pages. i.e. put them in one place
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}