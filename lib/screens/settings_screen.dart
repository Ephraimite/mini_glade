
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mini_glade/components/resuseable_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReuseableAppBar(title: Text('Settings screen'),),
      body: Center(
        child: Text(
          'Settings screen',
          style:  TextStyle(
            fontSize: 16.sp,
          ),
        ),
      ),

    );
  }
}
