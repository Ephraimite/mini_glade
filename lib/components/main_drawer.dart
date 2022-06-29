import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mini_glade/components/navigator.dart';
import 'package:mini_glade/screens/help_screen.dart';
import 'package:mini_glade/screens/login_screen.dart';
import 'package:mini_glade/screens/settings_screen.dart';
import 'package:mini_glade/screens/transaction_history.dart';

import 'drawer_list_tile.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 48.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50.h,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Icon(Icons.person),
                SizedBox(
                  width: 15.h,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    'Ephraim Ibatt',
                    style:
                    TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Glade User',
                    style:
                    TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
                  ),
                ]),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          
          ReuseableDrawerListTile(
            iconData: Icons.settings,
            text: 'Settings',
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsScreen())),
          ),
          ReuseableDrawerListTile(
            iconData: Icons.help,
            text: 'help',
            onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> HelpScreen())),
          ),
          ReuseableDrawerListTile(
            iconData: Icons.history,
            text: 'Transaction history',
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> TransactionHistoryScreen())),
          ),
          const Divider(
            height: 30,
            thickness: 2.0,
          ),
          Spacer(),
          const Divider(
            height: 30,
            thickness: 2.0,
          ),
          ReuseableDrawerListTile(
            iconData: Ionicons.log_out,
            text: 'Logout',
            onTap: ()=>navigateAndRemoveUntilRoute(context, LoginScreen()),
          ),
        ],
      ),
    );
  }
}
