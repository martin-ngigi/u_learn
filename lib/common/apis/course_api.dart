import 'package:u_learn/common/entities/course.dart';
import 'package:u_learn/common/utils/http_util.dart';

class CourseAPI{
  static Future<CourseListResponseEntity> courseList() async {
    var response =await HttpUtil().post('/api/course-list');
    print("-----> CourseAPI response ${response.data}");
    return CourseListResponseEntity.fromJson(response.data);
  }
}