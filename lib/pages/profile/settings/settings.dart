import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learn/common/routes/names.dart';
import 'package:u_learn/common/values/constants.dart';
import 'package:u_learn/global.dart';
import 'package:u_learn/pages/application/bloc/app_blocs.dart';
import 'package:u_learn/pages/application/bloc/app_events.dart';
import 'package:u_learn/pages/home/bloc/home_page_blocs.dart';
import 'package:u_learn/pages/home/bloc/home_page_events.dart';
import 'package:u_learn/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:u_learn/pages/profile/settings/bloc/settings_states.dart';
import 'package:u_learn/pages/profile/settings/widgets/settings_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  _removeUserData(){
    /// This will enable befor logout, set the current page index is zero [HomePage]
    context.read<AppBlocs>().add(const TriggerAppEvent(0));
    context.read<HomePageBlocs>().add(const HomePageDots(0));

    /// clear storage
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_KEY);

    ///navigate to sign in page
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBlocs, SettingsStates>(
            builder: (context, state) {
              return Container(
                child: Column(
                  children: [

                    ///logout button
                    settingsButton(context, _removeUserData)
                  ],
                ),
              );
            }),
      ),
    );
  }
}
