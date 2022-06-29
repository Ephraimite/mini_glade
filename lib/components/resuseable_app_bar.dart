
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mini_glade/constants/colors.dart';

class ReuseableAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text? title;
  final IconData? iconData;


  ReuseableAppBar({this.title, this.iconData});

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
          color: blackColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins'),
      elevation: 0,

      backgroundColor: Colors.transparent,
      title: title,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15, top: 8, bottom: 8),
        child: IconButton(
            onPressed: ()=> Navigator.pop(context), icon: const Icon(Ionicons.chevron_back)),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () {},
              icon:  Icon(iconData, size: 20,color: colorPrimary,)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
