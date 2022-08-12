// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_app/controllers/data_controller.dart';
import 'package:task_app/screens/homepage.dart';
import 'package:get/get.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  loadData() async {
    Get.find<DataController>().getDatas().toString();
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DataController());
    loadData();
    return GetMaterialApp(
      home: const Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
