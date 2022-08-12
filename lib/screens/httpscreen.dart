import 'package:flutter/material.dart';
import 'package:task_app/controllers/httpmodel.dart';
import 'package:task_app/services/httpservice.dart';

class Homedage extends StatefulWidget {
  const Homedage({Key? key}) : super(key: key);

  @override
  State<Homedage> createState() => _HomedageState();
}

class _HomedageState extends State<Homedage> {
  List<TaskModel>? task;
  var isLoaded = false;

  // late var number = users?.length.toString();

  @override
  void initState() {
    super.initState();

    //fecthing the data
    getData();
  }

  getData() async {
    task = await RemoteServices().getPosts();
    if (task != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Visibility(
          replacement: Center(child: CircularProgressIndicator()),
          visible: isLoaded,
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Center(
                child: Container(
                    color: Colors.red,
                    height: 120,
                    width: 120,
                    child: Text(task![1].taskDetail.toString())),
              );
            },
          ),
        ),
      ),
    );
  }
}
