import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomDropDownList<T> extends StatelessWidget {
  final String? title;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T> onChanged;
  final String? hint;
  final T? value;
  final String? errorText;
  double? height = 5.h;
  double? width = 30.w;

  CustomDropDownList({
    this.title,
    required this.items,
    required this.onChanged,
    this.hint,
    // this.value,
    this.errorText,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height,
          width: width,
          child: DropdownButton<T>(
            items: items,
            onChanged: (item) {
              onChanged.call(item!);
            },
            value: value,
            isExpanded: true,
          ),
        )
      ],
    );
  }
}
