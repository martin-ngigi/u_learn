import 'package:u_learn/pages/sign_in/bloc/sign_in_states.dart';

///use abstract because of the way Event are triggered
abstract class SignInEvent{
  const SignInEvent();
}

class EmailEvent extends SignInEvent{
  final String email;
  const EmailEvent(this.email);
}

class PasswordEvent extends SignInEvent{
  final String password;
  const PasswordEvent(this.password);
}