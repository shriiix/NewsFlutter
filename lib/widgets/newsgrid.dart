import 'package:flutter/material.dart';
import 'package:news_mvvm_demo/screens/detailscreen.dart';
import 'package:news_mvvm_demo/viewmodel/viewmodel.dart';
import 'package:news_mvvm_demo/widgets/circle_widget.dart';

class NewsScreen extends StatelessWidget {
  List<ViewModel> article;
  NewsScreen({Key? key, required this.article}) : super(key: key);

  void _showDetailPage(BuildContext context, ViewModel vm) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return DetailScreen(
        article: vm,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: article.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (_, index) {
        var data = article[index];

        return GestureDetector(
          onTap: () {
            _showDetailPage(context, data);
          },
          child: GridTile(
            child: Container(
              child: CircleImage(img: data.urlToImage),
            ),
            footer: Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                data.title,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
    );
  }
}
