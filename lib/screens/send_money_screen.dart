import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mini_glade/components/navigator.dart';
import 'package:mini_glade/components/resuseable_app_bar.dart';
import 'package:mini_glade/constants/colors.dart';
import 'package:mini_glade/screens/send_money_other_banks.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReuseableAppBar(
        title: Text('Send money'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h,),
              Text(
                'Send money with ease',
                style: TextStyle(
                    fontSize: 18.sp,
                    color: blackColor,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 30.h,),
              ReuseableLatestTransactions(
                tittle: 'To glade account',
                text: 'send money to other glade user',
                icon: 'assets/images/glade_to_glade.png',
              ),
              ReuseableLatestTransactions(
                tittle: 'Other banks',
                text: 'send money to other banks in nigeria',
                icon: 'assets/images/bank.png',
                onPressed: ()=> navigateToRoute(context, SendMoneyToOtherBanksScreen()),
              ),
              ReuseableLatestTransactions(
                tittle: 'International transfer',
                text: 'transfer to international accounts',
                icon: 'assets/images/international.png',
              ),
              ReuseableLatestTransactions(
                tittle: 'Request money',
                text: 'Request money from friends and family',
                icon: 'assets/images/personal.png',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReuseableLatestTransactions extends StatelessWidget {
  final String icon;
  final String tittle;
  final String text;
  final Function()? onPressed;

  ReuseableLatestTransactions({
    required this.icon,
    required this.tittle,
    required this.text, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration:
                      const BoxDecoration(color: lightGrey, shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      icon,
                      width: 40.w,
                      height: 40.h,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tittle,
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp, color: colorPrimary),
                      ),
                      Text(
                        text,
                        style: TextStyle(fontSize: 13.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
