import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mini_glade/components/resuseable_app_bar.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReuseableAppBar(title: Text('Transaction history'),),
      body: Center(
        child: Text(
          'Transaction history',
          style:  TextStyle(
            fontSize: 16.sp,
          ),
        ),
      ),

    );

  }
}
