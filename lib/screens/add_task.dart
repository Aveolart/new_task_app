// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/colors/app_colors.dart';
import 'package:task_app/widgets/buttonwidget.dart';
import 'package:task_app/widgets/textfield_widget.dart';

class AddTAsk extends StatefulWidget {
  // final String text;

  const AddTAsk({Key? key}) : super(key: key);

  @override
  State<AddTAsk> createState() => _AddTAskState();
}

class _AddTAskState extends State<AddTAsk> {
  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/addtask1.jpg"),
              fit: BoxFit.fitWidth,
            ),
          ),
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_outlined,
                      ))
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 4.5,
              ),
              Column(
                children: [
                  TextFieldWidget(
                    textController: titleController,
                    hintText: "Add task",
                    radius: 30,
                    maxline: 1,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFieldWidget(
                    textController: detailsController,
                    hintText: "Task details",
                    radius: 20,
                    maxline: 4,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ButtonWidget(
                      title: "Add",
                      textColor: Colors.white,
                      backgroundColor: AppColors.mainColor)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
