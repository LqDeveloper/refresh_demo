import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:refresh_demo/joke_model.dart';

class DioManager {
  static DioManager _instance = DioManager._internal();

  static DioManager get instance => _instance;

  late Dio _dio;

  DioManager._internal() {
    _dio = Dio();
    _dio.options.baseUrl = 'https://api.apiopen.top';
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 5000;
    _dio.options.responseType = ResponseType.json;
    _dio.interceptors.add(LogInterceptor(
        requestHeader: true, requestBody: true, responseBody: true));
    _dio.interceptors.add(CookieManager(CookieJar()));
  }

  factory DioManager() {
    return _instance;
  }

  Future<JokeModel> getJoke(int page, int count,
      {String type = 'video'}) async {
    var response = await _dio.get('/getJoke',
        queryParameters: {'page': page, 'count': count, 'type': type});
    return response.data.map((e) => JokeModel.fromJson(e));
  }
}

extension MapOnObject<T> on T {
  T map<T>(T f(dynamic e)) {
    return f(this);
  }
}
