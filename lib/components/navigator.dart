
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

navigateToRoute(BuildContext context, dynamic routeClass) {
  Navigator.push(context, CupertinoPageRoute(builder: (context) => routeClass));
}

void navigateAndRemoveUntilRoute(BuildContext? context, dynamic routeClass) {
  Navigator.pushAndRemoveUntil(context!,
      CupertinoPageRoute(builder: (context) => routeClass), (route) => false);
}