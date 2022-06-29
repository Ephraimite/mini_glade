import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mini_glade/constants/colors.dart';
import 'package:mini_glade/screens/settings_screen.dart';
import 'package:mini_glade/screens/transaction_history.dart';
import 'home_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final bottomNavigationScreens = [
      HomeScreen(),
      const TransactionHistoryScreen(),
      const SettingsScreen(),
    ];

    void _onItemTap(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    return Scaffold(
      body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 1000),
          transitionBuilder: (Widget child, Animation<double> primaryAnimation,
                  Animation<double> secondaryAnimation) =>
              FadeThroughTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              ),
          child: bottomNavigationScreens[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onItemTap,
        elevation: 16,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
              _currentIndex == 0 ? colorPrimary : Colors.transparent,
            ),child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(Icons.home,  size: 22.sp,
              ),
            )),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
              _currentIndex == 1 ? colorPrimary : Colors.transparent,
            ),child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.history, size: 22.sp),
            )),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Container(decoration: BoxDecoration(
              
              shape: BoxShape.circle,
              color:
              _currentIndex == 2 ? colorPrimary : Colors.transparent,
            ),child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.settings, size: 22.sp),
            )),
            label: 'Settings',
          ),
        ],
        selectedItemColor: loaderColor,
        selectedLabelStyle:  TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
      ),
    );
  }
}
