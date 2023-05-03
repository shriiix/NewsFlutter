import 'package:flutter/material.dart';
import 'package:news_mvvm_demo/viewmodel/viewmodel.dart';
import 'package:news_mvvm_demo/widgets/circle_widget.dart';

class DetailScreen extends StatelessWidget {
  final ViewModel article;
  const DetailScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: CircleImage(img: article.urlToImage),
            ),
            Text(
              article.publishedAt,
              style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                article.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                article.description,
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
