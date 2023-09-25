import '../../../common/entities/course.dart';

class HomePageEvents{
  const HomePageEvents();
}

class HomePageDots extends HomePageEvents{
  final int index;
  const HomePageDots(this.index):super();
}

class HomePageCourseItem extends HomePageEvents{
  const HomePageCourseItem(this.courseItem);
  final List<CourseItem> courseItem;
}