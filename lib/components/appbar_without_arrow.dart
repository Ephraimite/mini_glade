

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class AppBarWithoutArrow extends StatelessWidget implements PreferredSizeWidget {
  final Text? title;
  final IconData? iconData;


  AppBarWithoutArrow({this.title, this.iconData});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle:  TextStyle(
          color: Colors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins'),
      elevation: 0,

      backgroundColor: Colors.transparent,
      title: title,
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () {},
              icon:  Icon(iconData, size: 35,)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
