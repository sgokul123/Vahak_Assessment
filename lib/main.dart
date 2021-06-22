import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vahak_assessment/repository/api_repository.dart';
import 'package:vahak_assessment/ui/wiki_search_screen.dart';

void main() {
  Get.put(APIRepository());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WikiSearchScreen(),
    );
  }
}
