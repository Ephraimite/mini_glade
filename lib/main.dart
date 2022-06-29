
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_glade/screens/splash_screen.dart';
import 'package:mini_glade/view_models/home_viewmodel.dart';
import 'package:mini_glade/view_models/login_viewmodel.dart';
import 'package:mini_glade/view_models/send_money_viewmodel.dart';
import 'package:provider/provider.dart';

import 'constants/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ScreenUtilInit(
      builder: (context , child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=> HomeViewModel()),
          ChangeNotifierProvider(create: (_)=> SendMoneyViewModel(context)),
          ChangeNotifierProvider(create: (_)=> LoginViewModel(context)),
        ],
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: ThemeData().colorScheme.copyWith(
              primary: colorPrimary,
            ),
            fontFamily: 'Poppins',
          ),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
      designSize: const Size(414, 896),
    ),
  );
}