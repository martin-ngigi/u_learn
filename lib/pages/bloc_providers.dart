import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learn/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:u_learn/pages/welcome/bloc/welcome_blocs.dart';

import '../app_blocs.dart';

class AppBlocProviders{
  static get allBlocProviders => [
    BlocProvider(
      // lazy: false,
      create: (context) => WelcomeBloc(),
    ),
    BlocProvider(
      //lazy: false, /// lazy: false will ask flutter to create the bloc first.
      create: (context) => AppBlocs(),
    ),

    BlocProvider(create: (context) => SignInBloc()),
  ];
}