import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learn/app_blocs.dart';
import 'package:u_learn/app_events.dart';
import 'package:u_learn/app_states.dart';
import 'package:u_learn/pages/application/application_page.dart';
import 'package:u_learn/pages/bloc_providers.dart';
import 'package:u_learn/pages/register/register.dart';
import 'package:u_learn/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:u_learn/pages/sign_in/sign_in.dart';
import 'package:u_learn/pages/welcome/bloc/welcome_blocs.dart';
import 'package:u_learn/pages/welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'common/values/colors.dart';
import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform /// This is optional
  );

  /// print fcm token
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print(" ----------> [Main] FCM token $fcmToken");
  print("-----> main");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: ScreenUtilInit(
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
            home: ApplicationPage(),
            routes: {
              //"myHomePage": (context) => MyHomePage(),
              "signIn": (context) => SignIn(),
              "register": (context) => Register()
            },
          )
      ),
    );
  }
}

/**
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home page",
        ),
      ),
      body: Center(
        child: BlocBuilder<AppBlocs, AppStates>(
          builder: (context, state){
            return  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  "${BlocProvider.of<AppBlocs>(context).state.counter}",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: "heroTag1",
            onPressed: () => BlocProvider.of<AppBlocs>(context).add(Increment()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: "heroTag2",
            onPressed: (){
              BlocProvider.of<AppBlocs>(context).add(Decrement());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
**/