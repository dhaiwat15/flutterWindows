import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget buildTitleText({required String text, bool underlineText = true}) {
  return Text(text.toUpperCase(),
      style: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.bold,
          decoration: underlineText == true ? TextDecoration.underline : null,
          color: Colors.black));
}

Widget buildCommonText({required String text, bool underlineText = true}) {
  return Text(text.toUpperCase(),
      style: TextStyle(
          fontSize: 5.8.sp,
          fontWeight: FontWeight.bold,
          decoration: underlineText == true ? TextDecoration.underline : null,
          color: Colors.black));
}
