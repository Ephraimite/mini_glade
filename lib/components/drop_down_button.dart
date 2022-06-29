import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReuseableDropDownButton extends StatelessWidget {
  final String? selectedCategory;
  final Function(String?) onChange;
  List list = [];
  final String text;
  ReuseableDropDownButton({this.selectedCategory, required this.onChange, required this.text, required this.list});

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> dropDownItem = [];
    for (String category in list) {
      var newItem = DropdownMenuItem(child: Text(category), value: category);
      dropDownItem.add(newItem);
    }
    return DropdownButton<String>(
        hint:  Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(text),
        ),
        style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
            color: Colors.black87),
        underline: const SizedBox(),
        iconSize: 36.0.sp,
        isExpanded: true,
        value: selectedCategory,
        items: dropDownItem,
        onChanged: onChange);
  }
}