import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_glade/constants/colors.dart';

class ReuseableFilledButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Function? onPressed;
  final bool? isEnabled;
  final Color? backgroundColor;

  ReuseableFilledButton({
    required this.text,
    this.textColor,
    this.onPressed,
    this.isEnabled = true,
    this.backgroundColor,
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
          child: Text(
            text,
            style: TextStyle(
                fontSize: 16.sp, fontWeight: FontWeight.w500, color: textColor),
          )),
    );
  }
}
