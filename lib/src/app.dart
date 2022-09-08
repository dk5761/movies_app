import 'package:flutter/material.dart';
import 'package:movies_app/src/features/feed/presentation/pages/homeFeed.dart';
import 'package:movies_app/src/utils/scroll_configuration.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScrollConfiguration(
          behavior: MyBehavior(), child: SafeArea(child: const HomeFeedPage())),
    );
  }
}
