// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/colors/app_colors.dart';
import 'package:task_app/screens/all_tasks.dart';
import 'package:task_app/sqflite/database.dart';
import 'package:task_app/sqflite/database_model.dart';
import 'package:task_app/widgets/buttonwidget.dart';
import 'package:task_app/widgets/task_snackbar.dart';
import 'package:task_app/widgets/textfield_widget.dart';

class AddTAsk extends StatefulWidget {
  // final String text;
  final TaskApp? task;
  const AddTAsk({Key? key, this.task}) : super(key: key);

  @override
  State<AddTAsk> createState() => _AddTAskState();
}

class _AddTAskState extends State<AddTAsk> {
  DatabaseManager databaseManager = DatabaseManager();
  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  bool _dataValidation() {
    if (titleController.text.trim() == "") {
      SnackMessage.validationError("Task title", "Input task title");
      return false;
    } else if (detailsController.text.trim() == "") {
      SnackMessage.validationError("Task detail", "Input task detail");
      return false;
    } else if (titleController.text.length < 3) {
      SnackMessage.validationError("Too short", "task name is too short");
      return false;
    } else if (detailsController.text.length < 5) {
      SnackMessage.validationError("Too short", "task detail is too short");
      return false;
    }
    return true;
  }

  String tasktitle = "";
  String descriptionDetails = "";

  @override
  void initState() {
    if (widget.task != null) {
      tasktitle = widget.task!.title.toString();
      descriptionDetails = widget.task!.description.toString();
    }
    print("Id: ${widget.task?.id}");
    // print("Id: ${widget.taskApp?.title}");
    super.initState();
  }

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
                    textController: titleController..text = tasktitle,
                    hintText: "Add task",
                    radius: 30,
                    maxline: 1,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFieldWidget(
                    textController: detailsController
                      ..text = descriptionDetails,
                    hintText: "Task details",
                    radius: 20,
                    maxline: 4,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (widget.task == null) {
                        if (_dataValidation()) {
                          TaskApp newtask = TaskApp(
                            title: titleController.text.toString(),
                            description: detailsController.text.toString(),
                          );
                          await databaseManager
                              .insertTask(newtask)
                              .then((value) {
                            Get.off(() => AllTasks());
                            Get.snackbar("Successful", "Task has been added");
                          });
                        }
                      } else {
                        var id = widget.task!.id;
                        databaseManager
                            .updateTask(
                          id!,
                          titleController.text.toString(),
                          detailsController.text.toString(),
                        )
                            .then((value) {
                          Get.off(() => AllTasks());
                          Get.snackbar(
                            "Successful",
                            "Task has been updated",
                            animationDuration: Duration(milliseconds: 600),
                          );
                        });
                      }
                    },
                    child: ButtonWidget(
                        title: "Add",
                        textColor: Colors.white,
                        backgroundColor: AppColors.mainColor),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
