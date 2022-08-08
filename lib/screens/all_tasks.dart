// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/colors/app_colors.dart';
import 'package:task_app/screens/testing.dart';
import 'package:task_app/widgets/buttonwidget.dart';
import 'package:task_app/widgets/taskwidget.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List mydata = ["Try harder", "Try Smarter"];
    final leftIcon = Container(
      padding: EdgeInsets.only(right: 10),
      margin: EdgeInsets.only(bottom: 10),
      color: Color(0xFF2e3253),
      child: Icon(
        Icons.edit,
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
    );
    final rightIcon = Container(
      padding: EdgeInsets.only(right: 10),
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.redAccent,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
      alignment: Alignment.centerRight,
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height / 3.2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/header.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: IconButton(
                padding: EdgeInsets.all(20),
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Testing()));
                    },
                    child: Icon(
                      Icons.home_filled,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    maxRadius: 11,
                    child: Icon(
                      Icons.add,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.calendar_month_sharp,
                    color: AppColors.secondaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "2",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Flexible(
              child: ListView.builder(
                itemCount: mydata.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    background: leftIcon,
                    secondaryBackground: rightIcon,
                    onDismissed: (DismissDirection direction) {},
                    confirmDismiss: (DismissDirection direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        showModalBottomSheet(
                          context: context,
                          barrierColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          builder: (_) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Color(0x7A1C2941),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              padding: EdgeInsets.only(left: 20, right: 20),
                              height: MediaQuery.of(context).size.height / 1.8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ButtonWidget(
                                      title: "View",
                                      textColor: Colors.white,
                                      backgroundColor: AppColors.mainColor),
                                  ButtonWidget(
                                      title: "Edit",
                                      textColor: AppColors.secondaryColor,
                                      backgroundColor: AppColors.mainColor)
                                ],
                              ),
                            );
                          },
                        );
                        return false;
                      } else {
                        return Future.delayed(
                          Duration(seconds: 1),
                          () => direction == DismissDirection.endToStart,
                        );
                      }
                    },
                    key: ObjectKey(index),
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: TaskWidget(
                        text: mydata[index],
                        color: Colors.blueGrey,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
