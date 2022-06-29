import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mini_glade/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 5), () => checkFirstSeen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorPrimary,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: SizedBox(
                    width: 500.w,
                    height: 500.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Mini',
                          style: TextStyle(
                              fontSize: 35.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(width: 10.w,),
                        Image.asset('assets/images/logo_white.png'),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }

  checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    var email = prefs.getString('email');

    if (email != null) {
    } else if (_seen) {
      return Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      await prefs.setBool('seen', true);
      return Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }
}
