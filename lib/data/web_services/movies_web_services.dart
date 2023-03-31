import 'package:dio/dio.dart';
import 'package:flutter_imdb/constants/strings.dart';

class MoviesWebServices {
  late Dio dio;

  MoviesWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20), // 2o seconds
      receiveTimeout: const Duration(seconds: 20),
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getMovies() async {
    try {
      Response response = await dio.get('s=john wick&page=1');
      print(response.data["Search"].toString());
      return response.data["Search"];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
