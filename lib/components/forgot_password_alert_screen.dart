import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_glade/components/reuseable_filled_button.dart';
import 'package:mini_glade/constants/colors.dart';

class CancelBookingDialog extends StatelessWidget {
  final String title;
  final String text;
  final Function()? yesButtonPressed;
  final Function()? noButtonPressed;
  CancelBookingDialog(
      {required this.title,
      required this.text,
      this.yesButtonPressed,
      this.noButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.antiAlias,
      insetPadding: EdgeInsets.all(24),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width / 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  "assets/images/black_logo.png",
                  height: 100,
                ),
              ),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Text('Name: ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: Text('$text ?',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                            color: loaderColor)),
                  ),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: ReuseableFilledButton(
                    onPressed: noButtonPressed,
                    text: 'No',
                    backgroundColor: Colors.red.shade600,
                    textColor: Colors.white,
                  )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                      child: ReuseableFilledButton(
                    onPressed:  yesButtonPressed,
                    text: 'Yes',
                    textColor: Colors.white,
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
