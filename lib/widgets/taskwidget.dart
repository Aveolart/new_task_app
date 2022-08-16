import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  final String text;
  final String description;
  final Color color;

  const TaskWidget(
      {Key? key,
      required this.text,
      required this.description,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: double.maxFinite,
      // height: MediaQuery.of(context).size.height / 7,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFedF0F8),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 20, color: color, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            description,
            style: TextStyle(fontSize: 20, color: color),
          ),
        ],
      ),
    );
  }
}

