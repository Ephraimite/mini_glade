
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class ReuseableDrawerListTile extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Function()? onTap;


  ReuseableDrawerListTile({required this.iconData, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        iconData,
        size: 20,
        color: Colors.black87,
      ),
      title: Text(
        text,
        style:  TextStyle(
          fontSize: 16.sp,
        ),
      ),
    );
  }
}