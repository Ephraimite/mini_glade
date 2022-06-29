
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_glade/constants/colors.dart';

class FilledButtonWithIcon extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Function? onPressed;
  final bool? isEnabled;
  final Color? backgroundColor;
  final IconData? shareIcon;
  final IconData? viewIcon;

  FilledButtonWithIcon({
    required this.text,
    this.textColor,
    this.onPressed,
    this.isEnabled = true,
    this.backgroundColor, this.shareIcon, this.viewIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 15.h),
            ),
            backgroundColor: isEnabled == false
                ? MaterialStateProperty.all(backgroundColor == null
                ? colorPrimaryLight
                : Colors.red.shade600)
                : MaterialStateProperty.all(backgroundColor == null
                ? colorPrimary
                : Colors.red.shade600),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
          ),
          onPressed: () => isEnabled == false
              ? () {}
              : onPressed != null
              ? onPressed!()
              : null,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                viewIcon ==null? Container(): Icon(Icons.receipt, color: Colors.white,),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 14.sp, fontWeight: FontWeight.w500, color: textColor),
                ),
                shareIcon ==null? Container(): Icon(Icons.share,  color: Colors.white,),
              ],
            ),
          )),
    );
  }
}
