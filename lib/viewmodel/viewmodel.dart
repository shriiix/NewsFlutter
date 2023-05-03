import 'package:intl/intl.dart';
import 'package:news_mvvm_demo/model/model_file.dart';

class ViewModel {
  ModelNewsArticle _modelNewsArticle;

  ViewModel({required ModelNewsArticle article}) : _modelNewsArticle = article;

  String get title {
    return _modelNewsArticle.title;
  }

  String get description {
    return _modelNewsArticle.description;
  }

  String get url {
    return _modelNewsArticle.url;
  }

  String get urlToImage {
    return _modelNewsArticle.urlToImg;
  }

  String get publishedAt {
    final dateTime = DateFormat('yyyy-mm-ddTHH:mm:ssz')
        .parse(_modelNewsArticle.publishedAt, true);

    String date = DateFormat.yMMMMEEEEd('en-us').format(dateTime);

    return date;
  }
}
