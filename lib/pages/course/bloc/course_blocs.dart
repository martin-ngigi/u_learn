import 'package:bloc/bloc.dart';

import 'package:u_learn/pages/course/bloc/course_events.dart';
import 'package:u_learn/pages/course/bloc/course_states.dart';
class CourseBlocs extends Bloc<CourseEvents, CourseStates>{
   CourseBlocs():super(const CourseStates()){
    on<TriggerCourse>(_triggerCourse);
  }

  void _triggerCourse(TriggerCourse event, Emitter<CourseStates>emit){
    emit(state.copyWith(courseItem: event.courseItem));
  }
}