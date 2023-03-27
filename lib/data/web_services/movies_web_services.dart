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
      Response response = await dio.get('s=harry%20potter&page=1');
      print(response.data.toString());
      return response.data["search"];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
