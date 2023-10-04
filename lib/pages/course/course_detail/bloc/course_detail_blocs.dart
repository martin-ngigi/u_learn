import 'package:flutter_bloc/flutter_bloc.dart';

import 'course_detail_events.dart';
import 'course_detail_states.dart';


class CourseDetailBlocs extends Bloc<CourseDetailEvents, CourseDetailStates>{
  CourseDetailBlocs():super(const CourseDetailStates()){
    on<TriggerCourseDetail>(_triggerCourseDetail);
  }

  void _triggerCourseDetail(TriggerCourseDetail event, Emitter<CourseDetailStates>emit){
    print("---> _triggerCourseDetail ${event.courseItem.description}");
    emit(state.copyWith(courseItem: event.courseItem));
  }
}