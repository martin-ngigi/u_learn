import 'package:dio/dio.dart';
import 'package:u_learn/common/values/constants.dart';

class HttpUtil {
  /// singleton - you only create/initialize one class
  /// We maintain one instance of the class through out the app
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }

  late Dio dio;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstants.SERVER_API_URL,
        connectTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(seconds: 5),
        headers: {},
        contentType: "application/json: charset=utf-8",
        responseType: ResponseType.json);

    /// initialize Dio
    dio = Dio(options);
  }

  /// POST REQUEST
  Future post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    var response =
        await dio.post(path, data: data, queryParameters: queryParameters);
    print("--------> [HttpUtil] response: ${response.data}");

    return response;
  }
}
