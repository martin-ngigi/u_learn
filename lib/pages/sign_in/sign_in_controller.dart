import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learn/common/values/constants.dart';
import 'package:u_learn/common/widgets/flutter_toast.dart';
import 'package:u_learn/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../global.dart';

class SignInController {
  final BuildContext context;

  const SignInController({
    required this.context,
  });

  void handleSignIn(String type) async {
    try {
      if (type == "email") {
        // final state2 =  BlocProvider.of<SignInBloc>(context).state;
        final state = context.read<SignInBloc>().state;

        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          //print("-------------> [SignInController] Email empty");
          toastInfo(msg: "You need to fill in email address");
          return;
        }
        if (password.isEmpty) {
          // print("-------------> [SignInController] Password empty");
          toastInfo(msg: "You need to fill in password address");
          return;
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);

          if(credential.user == null){
            // print("-------> [SignInController] Error: user is null");
            toastInfo(msg: "You don't exist in DB");
            return;
          }
          if(! credential.user!.emailVerified){
            // print("-------> [SignInController] Error: user email not verified");
            toastInfo(msg: "You need to verify email account");
            return;
          }

          var user = credential.user;
          if(user!=null){
            /// we got verified user from firebase
            // print("-------> [SignInController] Success getting user from firebase");
            toastInfo(msg: "Success: User Exist", backgroundColor: Colors.green);
            Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY, "12345678");
            Navigator.of(context).pushNamedAndRemoveUntil("/application", (route) => false);
          }
          else{
            /// We have an error getting user from firebase
            // print("-------> [SignInController] Error: We have an error getting user from firebase");
            toastInfo(msg: "Currently, you are not a user of this app.");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if(e.code == 'user-not-found'){
            // print("-------> [SignInController] Error: User not found for that email");
            toastInfo(msg: "User not found for that email");

          }
          else if(e.code == 'wrong-password'){
            // print("-------> [SignInController] Error: Wrong password provided for that user");
            toastInfo(msg: " Wrong password provided for that user");
          }
          else if(e.code == 'invalid-email'){
            // print("-------> [SignInController] Error: Your email is invalid");
            toastInfo(msg: "Your email is invalid");
          }
          else if(e.code == 'user-disabled'){
            // print("-------> [SignInController] Error: Your account is disabled.");
            toastInfo(msg: "Your account is disabled.");
          }
        }
      }
    } catch (e) {}
  }
}
