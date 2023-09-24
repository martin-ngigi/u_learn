import 'package:u_learn/common/entities/course.dart';

class HomePageStates {
  const HomePageStates({
    this.index = 0,
    this.courseItem = const <CourseItem>[]
  });

  final int index;
  final List<CourseItem> courseItem;

  HomePageStates copyWith({int? index, List<CourseItem>? courseItem}) {
    return HomePageStates(
        index: index ?? this.index, /// if index is empty, use the default index which is 0
        courseItem: courseItem??this.courseItem
    );
  }
}
