// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_app/colors/app_colors.dart';
import 'package:task_app/screens/add_task.dart';
import 'package:task_app/screens/all_tasks.dart';
import 'package:task_app/widgets/buttonwidget.dart';
import "package:get/get.dart";

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          padding: EdgeInsets.only(left: 20, right: 20, top: 60),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/welcome.jpg"), fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                    text: "Hello",
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: "\nInput your task below",
                        style: TextStyle(
                          color: AppColors.smallTextColor,
                          fontSize: 16,
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.5,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => AddTAsk(),
                      transition: Transition.zoom,
                      duration: Duration(milliseconds: 500));
                },
                child: ButtonWidget(
                    title: "Add Task",
                    textColor: Colors.white,
                    backgroundColor: AppColors.mainColor),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => AllTasks(),
                      transition: Transition.cupertinoDialog,
                      duration: Duration(milliseconds: 500));
                },
                child: ButtonWidget(
                    title: "View All",
                    textColor: AppColors.smallTextColor,
                    backgroundColor: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
