import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learn/pages/sign_in/bloc/sign_in_events.dart';
import 'package:u_learn/pages/sign_in/bloc/sign_in_states.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>{
  SignInBloc():super(const SignInState()){
    /// trigger email changes
    on<EmailEvent> (_emailEvent); /// _emailEvent is the handler

    ///
    on<PasswordEvent>(_passwordEvent); /// _passwordEvent is the handler.
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit){
    /// In this case emit is an instance of emitter. So we are calling emit as method.
    //print("-------> [SignInBloc] My email is: ${event.email}");
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit){
    //print("-------> [SignInBloc] My password is: ${event.password}");
    emit(state.copyWith(password: event.password));
  }
}