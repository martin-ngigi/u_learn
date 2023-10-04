import 'package:u_learn/common/entities/course.dart';

class CourseStates {
  const CourseStates({this.courseItem}); /// this.courseItem is optional

  final CourseItem? courseItem;

  CourseStates copyWith({CourseItem? courseItem}){
    return CourseStates(
        courseItem:courseItem??this.courseItem
    );
  }
}
