import 'package:news/core/remote/network/api_manager.dart';
import 'package:news/feature/home/models/news_response.dart';
import 'package:news/feature/home/models/sources_response.dart';

class ApiServices {
  static Future<List<Articles>> getNews(String sourceId) async {
    try {
      var response = await ApiManager.dio.get(
        'everything',
        queryParameters: {'sources': sourceId},
      );
      if (response.statusCode == 200) {
        var data = NewsResponse.fromJson(response.data);
        return data.articles ?? [];
      } else {
        throw response.data['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Sources>> getSources(String categoryId) async {
    try {
      var response = await ApiManager.dio.get(
        'top-headlines/sources',
        queryParameters: {'category': categoryId},
      );
      if (response.statusCode == 200) {
        var data = SourcesResponse.fromJson(response.data);
        return data.sources ?? [];
      } else {
        throw response.data['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
