import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learn/common/values/constants.dart';
import 'package:u_learn/common/widgets/flutter_toast.dart';
import 'package:u_learn/pages/register/bloc/register_bloc.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context
        .read<RegisterBlocs>()
        .state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "User name can't be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email can't be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password can't be empty");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "RePassword can't be empty");
      return;
    }

    if (rePassword != password) {
      toastInfo(msg: "Password and RePassword don't match");
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if(credential.user != null){
        /// Send Email Verification
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        String photoUrl = "${AppConstants.SERVER_API_URL}/uploads/default.png";
        await credential.user?.updatePhotoURL(photoUrl);

        toastInfo(msg: "An email has been sent to your registered email. "
            "To activate it, please check your email primary, if not so, check spam/social");

        /// Navigate to previous page. i.e. Login
        Navigator.of(context).pop();

      }
    }
    on FirebaseAuthException catch (e) {
      /// hover on createUserWithEmailAndPassword to see a;;
      if (e.code == "weak-password") {
        toastInfo(msg: "The password provided is too weak ");
      }
      else if (e.code == "email-already-in-use") {
        toastInfo(msg: "Email already in use");
      }
      else if (e.code == "invalid-email") {
        toastInfo(msg: "Email is invalid");
      }
    }
  }
}