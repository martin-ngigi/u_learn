import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learn/pages/register/bloc/register_bloc.dart';
import 'package:u_learn/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:u_learn/pages/welcome/bloc/welcome_blocs.dart';

import '../app_blocs.dart';

class AppBlocProviders{
  static get allBlocProviders => [
    BlocProvider(create: (context) => WelcomeBloc(),),
    //BlocProvider(create: (context) => AppBlocs(),),
    BlocProvider(create: (context) => SignInBloc()),
    BlocProvider(create: (context) => RegisterBlocs()),
  ];
}