import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learn/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
          return;
        }
        if (password.isEmpty) {
          return;
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);

          if(credential.user == null){
            print("-------> [SignInController] Error: user is null");
          }
          if(credential.user!.emailVerified){
            print("-------> [SignInController] Error: user email not verified");

          }

          var user = credential.user;
          if(user!=null){
            /// we got verified user from firebase
            print("-------> [SignInController] Success getting user from firebase");

          }
          else{
            /// We have an error getting user from firebase
            print("-------> [SignInController] Error: We have an error getting user from firebase");

          }
        } catch (e) {

        }
      }
    } catch (e) {}
  }
}
