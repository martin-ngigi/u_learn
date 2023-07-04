import 'package:u_learn/common/entities/entities.dart';

import '../utils/http_util.dart';

class UserAPI {
  static login({LoginRequestEntity? params}) async {
    var response = await HttpUtil().post(
      '/api/login',
      queryParameters: params?.toJson(),
    );
    
    // print("--------> [UserAPI] Login Request: ${params?.toJson()}");
    print("--------> [UserAPI] Login response: ${response}");

    return UserLoginResponseEntity.fromJson(response.data);
  }
}
