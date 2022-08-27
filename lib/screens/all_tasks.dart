// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/colors/app_colors.dart';
import 'package:task_app/screens/add_task.dart';
import 'package:task_app/sqflite/database.dart';

import 'package:task_app/widgets/buttonwidget.dart';

import 'package:task_app/widgets/taskwidget.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  State<AllTasks> createState() => _AllTasksState();
}

@override
void initState() {}

class _AllTasksState extends State<AllTasks> {
  @override
  Widget build(BuildContext context) {
    DatabaseManager _databaseManager = DatabaseManager();

    // List mydata = ["Try harder", "Try Smarter"];
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
      floatingActionButton: Container(
        margin: EdgeInsets.only(top: 30, left: 20),
        width: MediaQuery.of(context).size.width / 2.5,
        child: InkWell(
          onTap: () {
            Get.to(() => AddTAsk(),
                    transition: Transition.cupertinoDialog,
                    duration: Duration(milliseconds: 500))
                ?.then((value) {
              setState(() {});
            });
          },
          child: ButtonWidget(
              title: "Add Task",
              textColor: Colors.white,
              backgroundColor: AppColors.mainColor),
        ),
      ),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // IconButton(
                  //   padding: EdgeInsets.all(20),
                  //   onPressed: () {
                  //     Get.back();
                  //   },
                  //   icon: Icon(
                  //     Icons.arrow_back,
                  //   ),
                  // ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                    child: Text(
                      "My Todo App ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainColor,
                          fontSize: 25),
                    ),
                  ),

                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                    child: Text(
                      "Swipe left to delete and Swipe right or tap to Edit",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainColor,
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: FutureBuilder(
                  initialData: [],
                  future: _databaseManager.getTasks(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                              () => AddTAsk(
                                task: snapshot.data[index],
                              ),
                            )?.then((value) {
                              setState(() {});
                            });
                          },
                          child: Dismissible(
                            background: leftIcon,
                            secondaryBackground: rightIcon,
                            onDismissed: (DismissDirection direction) {
                              _databaseManager
                                  .deleteTask(snapshot.data[index].id);
                            },
                            confirmDismiss: (DismissDirection direction) async {
                              if (direction == DismissDirection.startToEnd) {
                                // Made a bottomsheet for testing
                                // showModalBottomSheet(
                                //   context: context,
                                //   barrierColor: Colors.transparent,
                                //   backgroundColor: Colors.transparent,
                                //   builder: (_) {
                                //     return Container(
                                //       decoration: BoxDecoration(
                                //         color: Color(0x7A1C2941),
                                //         borderRadius: BorderRadius.only(
                                //           topLeft: Radius.circular(20),
                                //           topRight: Radius.circular(20),
                                //         ),
                                //       ),
                                //       padding:
                                //           EdgeInsets.only(left: 20, right: 20),
                                //       height:
                                //           MediaQuery.of(context).size.height /
                                //               1.8,
                                //       child: Column(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.center,
                                //         children: [
                                //           ButtonWidget(
                                //               title: "View",
                                //               textColor: Colors.white,
                                //               backgroundColor:
                                //                   AppColors.mainColor),
                                //           ButtonWidget(
                                //               title: "Edit",
                                //               textColor:
                                //                   AppColors.secondaryColor,
                                //               backgroundColor:
                                //                   AppColors.mainColor)
                                //         ],
                                //       ),
                                //     );
                                //   },
                                // );
                                // return false;

                                Get.to(
                                        AddTAsk(
                                          task: snapshot.data[index],
                                        ),
                                        transition:
                                            Transition.leftToRightWithFade,
                                        duration: Duration(milliseconds: 500))
                                    ?.then((value) {
                                  setState(() {});
                                });
                              } else {
                                return Future.delayed(
                                  Duration(milliseconds: 20),
                                  () =>
                                      direction == DismissDirection.endToStart,
                                );
                              }
                            },
                            key: ObjectKey(index),
                            child: Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: TaskWidget(
                                text: snapshot.data[index].title,
                                color: Colors.blueGrey,
                                description: snapshot.data[index].description,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
