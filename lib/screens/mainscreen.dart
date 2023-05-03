import 'package:flutter/material.dart';
import 'package:news_mvvm_demo/constant/const.dart';
import 'package:news_mvvm_demo/screens/detailscreen.dart';
import 'package:news_mvvm_demo/viewmodel/listviewmodel.dart';
import 'package:news_mvvm_demo/viewmodel/viewmodel.dart';
import 'package:news_mvvm_demo/widgets/newsgrid.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ListViewModel>(context, listen: false).fetchTopheadlines();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<ListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "News App",
          style: TextStyle(fontSize: 28),
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) {
              return Constants.countries.keys
                  .map((v) => PopupMenuItem(
                        value: v,
                        child: Text(v),
                      ))
                  .toList();
            },
            onSelected: (country) {
              listViewModel.fetchNewsByCountry(Constants.countries[country]!);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Headlines',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
            ),
            Expanded(child: NewsScreen(article: listViewModel.article))
          ],
        ),
      ),
    );
  }
}
