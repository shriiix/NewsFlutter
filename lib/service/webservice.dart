import 'package:dio/dio.dart';
import 'package:news_mvvm_demo/constant/const.dart';
import 'package:news_mvvm_demo/constant/const.dart';
import 'package:news_mvvm_demo/model/model_file.dart';

class WebService {
  var dio = Dio();

  Future<List<ModelNewsArticle>> getToHeadLine() async {
    final response = await dio.get(Constants.topHeadLines);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => ModelNewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('Response failed');
    }
  }

  Future<List<ModelNewsArticle>> getNewsByCountry(String country) async {
    final response = await dio.get(Constants.headlinesFor(country));

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => ModelNewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('Response failed');
    }
  }
}
