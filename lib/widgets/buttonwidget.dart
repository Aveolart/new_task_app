// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_app/colors/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;

  ButtonWidget(
      {Key? key,
      required this.title,
      required this.textColor,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: backgroundColor,
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 20, color: textColor),
        ),
      ),
    );
  }
}

