import 'package:u_learn/common/entities/course.dart';

class CourseDetailStates {
  const CourseDetailStates({this.courseItem}); /// this.courseItem is optional

  final CourseItem? courseItem;

  CourseDetailStates copyWith({CourseItem? courseItem}){
    return CourseDetailStates(
        courseItem:courseItem??this.courseItem
    );
  }
}
