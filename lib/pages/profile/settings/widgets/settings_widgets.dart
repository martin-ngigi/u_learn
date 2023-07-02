import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learn/pages/common_widgets.dart';

import '../../../../common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      child: Container(
        child: reusableText("Settings")
      ),
    ),
  );
}

Widget settingsButton(BuildContext context, void Function()? func){
  return GestureDetector(
    onTap: () {
      /// logout
      showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text("Confirm logout"),
              content: Text(("Are you sure to logout")),
              actions: [
                /// cancel
                TextButton(
                    onPressed: (){
                      /// dimiss dialog
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel")
                ),

                /// Confirm
                TextButton(
                    onPressed:func,
                    child: Text("Confirm")
                ),
              ],
            );
          }
      );
    },
    child: Container(
      height: 100.w,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage("assets/icons/Logout.png")
          )
      ),
    ),
  );
}
