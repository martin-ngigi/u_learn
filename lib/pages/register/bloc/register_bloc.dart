import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learn/pages/register/bloc/register_events.dart';
import 'package:u_learn/pages/register/bloc/register_states.dart';

class RegisterBlocs extends Bloc<RegisterEvents, RegisterStates>{
  RegisterBlocs():super(const RegisterStates()){
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);
  }

  /// username handler
  void _userNameEvent(UserNameEvent event, Emitter<RegisterStates> emit){
    //print("-----> [RegisterBlocs] Username: ${event.userName}");
    emit(state.copyWith(userName: event.userName));
  }

  /// email handler
  void _emailEvent(EmailEvent event, Emitter<RegisterStates> emit){
    //print("-----> [RegisterBlocs] Email: ${event.email}");
    emit(state.copyWith(email: event.email));
  }

  /// password handler
  void _passwordEvent(PasswordEvent event, Emitter<RegisterStates> emit){
    //print("-----> [RegisterBlocs] Password: ${event.password}");
    emit(state.copyWith(password: event.password));
  }

  /// rePassword handler
  void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterStates> emit){
    //print("-----> [RegisterBlocs] Re-password: ${event.rePassword}");
    emit(state.copyWith(rePassword: event.rePassword));
  }
}