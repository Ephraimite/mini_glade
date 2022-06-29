import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mini_glade/components/general_widget/general_widget.dart';
import 'package:mini_glade/components/home_app_bar.dart';
import 'package:mini_glade/components/main_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_glade/components/navigator.dart';
import 'package:mini_glade/constants/colors.dart';
import 'package:mini_glade/screens/send_money_screen.dart';
import 'package:mini_glade/view_models/home_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<HomeViewModel>(context, listen: false);
    return Scaffold(
      key: _scaffoldKey,
      appBar: ReuseableHomeAppBar(
        title: const Text('Home'),
        iconData: Icons.notifications,
        onPressed: () => _scaffoldKey.currentState!.openDrawer(),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
          "${viewModel.dateTime.greetings} Ephraim",
                style: TextStyle(
                    color: blackColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r), color: lightGrey),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ' Wallet balance',
                            style: TextStyle(
                                color: blackColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          Align(
                              alignment: Alignment.topRight,
                              child: Image.asset('assets/images/black_logo.png', height: 20,)),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      nairaText(
                          amount: 20000,
                          currency: 'NGN ',
                          style: TextStyle(
                              color: colorPrimary,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w700)),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Icon(Ionicons.eye),
                          Text(
                            ' Hide balance',
                            style: TextStyle(
                                color: blackColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Text(
                ' Carry out transactions today!',
                style: TextStyle(
                    color: blackColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 50.h,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    QuickActionCategory(
                      iconPath: 'assets/images/sendmoney.png',
                      onTap: () {
                        navigateToRoute(context, SendMoneyScreen());
                      },
                      label: "Send money",
                    ),
                    QuickActionCategory(
                      iconPath: 'assets/images/bills.png',
                      onTap: () {},
                      label: "Pay bills",
                    ),
                    QuickActionCategory(
                      iconPath: 'assets/images/smartphone.png',
                      onTap: () {},
                      label: "Airtime/Data",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    QuickActionCategory(
                      iconPath: 'assets/images/transaction.png',
                      onTap: () {},
                      label: "Transactions",
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: QuickActionCategory(
                        iconPath: 'assets/images/signing.png',
                        onTap: () {},
                        label: " Apply for loans ",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: QuickActionCategory(
                        iconPath: 'assets/images/add.png',
                        onTap: () {},
                        label: "See all ",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuickActionCategory extends StatelessWidget {
  final String? label;
  final String? iconPath;
  final String? labelIconPath;
  final double width;
  final double height;
  final Function onTap;

  QuickActionCategory(
      {@required this.iconPath,
      this.width = 60,
      this.height = 60,
      required this.onTap,
      this.label,
      this.labelIconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () => onTap(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  color: lightGrey),
              padding: EdgeInsets.all(14),
              child: Image.asset(iconPath!),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    label!,
                    style: TextStyle(
                        fontSize: 13.0.sp,
                        color: colorPrimary,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  child: labelIconPath == null
                      ? null
                      : Image.asset(
                          labelIconPath!,
                          width: 15,
                          height: 15,
                        ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
