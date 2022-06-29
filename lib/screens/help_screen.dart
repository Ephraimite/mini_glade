import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mini_glade/components/resuseable_app_bar.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReuseableAppBar(title: Text('Help Desk'),),
      body: Center(
        child: Text(
          'Help Desk',
          style:  TextStyle(
            fontSize: 16.sp,
          ),
        ),
      ),

    );

  }
}
