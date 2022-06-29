import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_glade/components/navigator.dart';
import 'package:mini_glade/components/reuseable_filled_button.dart';
import 'package:mini_glade/screens/bottom_navigation_screen.dart';
import 'package:mini_glade/screens/home_screen.dart';

import 'filled_button_with_icon.dart';

class ReuseableSuccessSheet extends StatelessWidget {
  final String successTitleText;
  final Function()? onPressed;
  final Function()? shareReceiptPressed;
  final Function()? viewReceiptPressed;
  final IconData? iconData;
  final String title;
  final String buttonText;

  ReuseableSuccessSheet(
      {required this.successTitleText,
      this.onPressed,
      this.iconData,
      required this.title,
      required this.buttonText,
      this.shareReceiptPressed,
      this.viewReceiptPressed});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => navigateToRoute(context, const BottomNavigation()),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.0.w, vertical: 100.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Icon(
                    iconData,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Text(successTitleText),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: FilledButtonWithIcon(
                    text: 'View receipt',
                    textColor: Colors.white,
                    viewIcon: Icons.receipt,
                    onPressed: viewReceiptPressed,
                  )),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    child: FilledButtonWithIcon(
                      text: 'Share receipt',
                      textColor: Colors.white,
                      shareIcon: Icons.share,
                      onPressed: shareReceiptPressed,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              ReuseableFilledButton(
                onPressed: onPressed,
                text: buttonText,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
