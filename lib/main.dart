import 'package:flutter/material.dart';
import 'package:news_app_tdd_clean_arch/features/home/presentation/views/home_view.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewsApp',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
