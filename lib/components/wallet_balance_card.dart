
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mini_glade/constants/colors.dart';

import 'general_widget/general_widget.dart';

class WalletBalanceCard extends StatelessWidget {
  final double? balance;
  final String? accountNumber;
  final String? accountType;
  final String? currency;

  WalletBalanceCard({
    @required this.balance,
    @required this.accountNumber,
    @required this.currency,
    this.accountType = 'Wallet Account balance',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 3,
        semanticContainer: true,
        color: colorPrimary,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "$accountType ($accountNumber)",
                style: TextStyle(
                    fontSize: 14.0.sp, color: Colors.white, fontWeight: FontWeight.normal),
              ),
              Padding(padding: EdgeInsets.only(bottom: 5)),
              nairaText(
                currency: currency ?? '',
                precedingText: "",
                amount: balance ?? 0,
                style: TextStyle(
                    fontSize: 30.0.sp, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
