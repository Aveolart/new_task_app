// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_app/colors/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final double radius;
  final int? maxline;
  const TextFieldWidget(
      {Key? key,
      this.maxline,
      required this.textController,
      required this.hintText,
      required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 17),
      maxLines: maxline,
      autofocus: false,
      controller: textController,
      // keyboardType: TextInputType.name,
      enableSuggestions: true,
      
      decoration: InputDecoration(
      
        filled: true,
        
        border: InputBorder.none,
        fillColor: AppColors.textHolder,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
      ),
    );
  }
}
