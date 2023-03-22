import 'package:dio/dio.dart';

abstract class ApiService {
  final Dio dio;
  ApiService(this.dio) {
    // this.dio = Dio(BaseOptions(
    //   contentType: 'application/json; charset=UTF-8',
    //   baseUrl: Urls.BASE_API,
    // ));
  }

  String getErrorMsg(Object error);
}
