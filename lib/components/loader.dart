

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mini_glade/constants/colors.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.7),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
                width: 50.0.h,
                height: 50.0.h,
                child: const CircularProgressIndicator(
                  strokeWidth: 10,
                  backgroundColor: loaderColor,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      loaderColorLight),
                )),
          ),
        ],
      ),
    );
  }
}
