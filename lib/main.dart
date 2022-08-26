// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_app/screens/all_tasks.dart';

import 'package:task_app/screens/homepage.dart';
import 'package:get/get.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  // loadData() async {
  //   Get.find<DataController>().getDatas();
  // }

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => DataController());
    // loadData();
    return GetMaterialApp(
      home: AllTasks(),
      debugShowCheckedModeBanner: false,
    );
  }
}
