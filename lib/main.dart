import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learn/common/routes/pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:u_learn/global.dart';
import 'common/values/colors.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // providers: AppBlocProviders.allBlocProviders,
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        // designSize: const Size(375, 812), /// Default size
        designSize: const Size(375, 800),
          builder: (context, child) => MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: AppColors.primaryText
                ),
                elevation: 0,
                backgroundColor: Colors.white
              ),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            onGenerateRoute: AppPages.GenerateRouteSettings,
          )
      ),
    );
  }
}
