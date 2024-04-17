import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatefulWidget {
  double? width;
  double? height;
  String hint;
  final maxNumberLength;
  final maxInputLine;
  final TextEditingController controller;
  final TextInputType inputType;
  String labelText;
  bool validate;
  final validator;
  ValueChanged<String?>? onChanged;

  CustomTextFormField({
    this.width,
    this.hint = "",
    this.height,
    required this.controller,
    this.inputType = TextInputType.text,
    this.maxNumberLength,
    this.maxInputLine = 5,
    this.validate = false,
    required this.labelText,
    this.validator,
    this.onChanged,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 50.0.w,
      height: widget.height ?? 10.5.h,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: TextFormField(

          maxLines: widget.maxInputLine,
          controller: widget.controller,
          keyboardType: widget.inputType,
          maxLength: widget.maxNumberLength,
          validator: widget.validate == true
              ? (value) {
                  return value == null || value.isEmpty ? "This should not be empty" : null;
                }
              : null,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(left: 2.0.w, bottom: 1.0.h, top: 1.8.h),
              // border: InputBorder.none,
              // isCollapsed: true,
              counterText: "",
              border: OutlineInputBorder(
                borderSide: BorderSide(),
                // borderRadius: BorderRadius.circular(15)
              ),
              focusedBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              labelText: widget.labelText
              // hintText: widget.hint,
              ),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
