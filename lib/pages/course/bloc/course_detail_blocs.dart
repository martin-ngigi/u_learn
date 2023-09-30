import 'package:bloc/bloc.dart';

import 'package:u_learn/pages/course/bloc/course_detail_events.dart';
import 'package:u_learn/pages/course/bloc/course_detail_states.dart';
class CourseDetailBlocs extends Bloc<CourseDetailEvents, CourseDetailStates>{
  CourseDetailBlocs():super(const CourseDetailStates()){
    on<TriggerCourseDetail>(_triggerCourseDetail);
  }

  void _triggerCourseDetail(TriggerCourseDetail event, Emitter<CourseDetailStates>emit){
    emit(state.copyWith(courseItem: event.courseItem));
  }
}