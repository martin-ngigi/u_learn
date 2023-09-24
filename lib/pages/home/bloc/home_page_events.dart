import '../../../common/entities/course.dart';

class HomePageEvents{
  const HomePageEvents();
}

class HomePageDots extends HomePageEvents{
  final int index;
  HomePageDots(this.index);
}

class HomePageCourseItem extends HomePageEvents{
  const HomePageCourseItem(this.courseItem);
  final List<CourseItem> courseItem;
}