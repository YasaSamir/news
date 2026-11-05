import 'package:dio/dio.dart';
import 'package:news/core/utils/app_constants.dart';

class ApiManager {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org/v2/',
      headers:{
        "x-api-key": AppConstants.apiKey,
    }
    )
  );
}
