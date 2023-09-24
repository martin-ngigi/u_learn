import 'package:dio/dio.dart';
import 'package:u_learn/common/values/constants.dart';
import 'package:u_learn/global.dart';

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
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    Options requestOptions = options ?? Options();

    /// if options exists use options, else create new Options
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.post(path,
        data: data, queryParameters: queryParameters, options: requestOptions);
    print("--------> [HttpUtil] response: ${response.data}");

    return response;
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }
}
