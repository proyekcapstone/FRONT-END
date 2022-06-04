import 'package:capstone_project_jti/common/style.dart';
import 'package:capstone_project_jti/page_view.dart';
import 'package:capstone_project_jti/widgets/profile_page.dart';
import 'package:capstone_project_jti/widgets/detail_tab.dart';
import 'package:capstone_project_jti/widgets/home.dart';
import 'package:capstone_project_jti/widgets/detail_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogja Travel Information',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: myTextTheme,
        primaryColor: primaryColor,
      ),
      home: DetailTab(),
    );
  }
}