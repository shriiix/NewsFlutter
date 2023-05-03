import 'package:flutter/material.dart';
import 'package:news_mvvm_demo/screens/mainscreen.dart';
import 'package:news_mvvm_demo/viewmodel/listviewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ListViewModel(),
          ),
        ],
        child: MainScreen(),
      ),
    );
  }
}
