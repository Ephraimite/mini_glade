
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mini_glade/constants/colors.dart';

class ReuseableHomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Function()? onPressed;
  final IconData? iconData;
  final Text? title;



  ReuseableHomeAppBar({this.onPressed, this.iconData, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      leading: InkWell(
        onTap: onPressed,
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset('assets/images/menu_icon.png')
        ),
      ),
      titleTextStyle:  TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
      ),
      title: title,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions:  [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () {},
              icon:  Icon(iconData, size: 25.sp,color: colorPrimary,)),
        ),
      ],
    );
  }
  Size get preferredSize => Size.fromHeight(70);
}

