import 'package:u_learn/common/entities/base.dart';
import 'package:u_learn/common/entities/course.dart';
import 'package:u_learn/common/utils/http_util.dart';

class CourseAPI{
  static Future<CourseListResponseEntity> courseList() async {
    var response =await HttpUtil().post('/api/course-list');
    print("-----> CourseAPI courseList response ${response.data}");
    // return CourseListResponseEntity.fromJson(response);
    return CourseListResponseEntity.fromJson(response.data);
  }

  static Future<CourseDetailResponseEntity> courseDetail({required CourseRequestEntity? params}) async {
    var response =await HttpUtil().post('/api/course-detail', queryParameters: params?.toJson());
    print("-----> CourseAPI courseDetail response ${response.data}");
    return CourseDetailResponseEntity.fromJson(response.data);
  }

  static Future<BaseResponseEntity> coursePay({CourseRequestEntity? params}) async{
    var response =  await HttpUtil().post("/api/checkout", queryParameters: params?.toJson());
    return BaseResponseEntity.fromJson(response.data);
  }
}