import 'package:flutter/cupertino.dart';
import 'package:news_mvvm_demo/model/model_file.dart';
import 'package:news_mvvm_demo/service/webservice.dart';
import 'package:news_mvvm_demo/viewmodel/viewmodel.dart';

enum LoadingStatus { completed, searching, empty }

class ListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;

  List<ViewModel> article = <ViewModel>[];

// ? fetch headline news
  void fetchTopheadlines() async {
    List<ModelNewsArticle> _newsArticle = await WebService().getToHeadLine();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();
    article =
        _newsArticle.map((article) => ViewModel(article: article)).toList();

    if (article.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }

// ? fetch news by country
  void fetchNewsByCountry(String country) async {
    List<ModelNewsArticle> _newsArticle =
        await WebService().getNewsByCountry(country);

    loadingStatus = LoadingStatus.searching;
    notifyListeners();
    article =
        _newsArticle.map((article) => ViewModel(article: article)).toList();

    if (article.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
