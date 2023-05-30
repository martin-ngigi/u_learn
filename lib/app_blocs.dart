import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learn/app_events.dart';
import 'package:u_learn/app_states.dart';

class AppBlocs extends Bloc<AppEvents, AppStates>{
  AppBlocs():super(InitStates()){
    print("----> [AppBlocs] created");
    /// register events.
    on<Increment>((event, emit){
      emit(AppStates(counter: state.counter+1));
      print("Increase current value is: ${state.counter}");
    });

    on<Decrement>((event, emit){
      emit(AppStates(counter: state.counter-1));
      print("Decreased current value is: ${state.counter}");
    });
  }



}