
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget nairaText(
    {required double? amount,
      String? precedingText = "",
      String? trailingText = "",
      TextStyle style = const TextStyle(
          color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
      String? currency = ""}) {
  return RichText(
    textAlign: TextAlign.start,
    text: TextSpan(
      text: '$precedingText ${formatAmount(amount, currency)} $trailingText',
      style: style,
    ),
  );
}

String getNairaSymbol(String? currency) {
  if (currency!.isNotEmpty && currency.contains("USD")) return "\u{00024}";
  if (currency.isNotEmpty && currency.contains("GBP")) return "\u{00A3}";
  if (currency.isNotEmpty && currency.contains("NGN"))
    return "\u{20A6}";
  else
    return currency;
}

String formatAmount(double? amount, [String? currency = '']) {
  var formatter = NumberFormat("#,##0.00", "en_US");
  return "${getNairaSymbol(currency)}${formatter.format(amount)}";
}

void showSnackBar(String text, BuildContext context){
  var snackBar = SnackBar(
    content:  Text(text),
    backgroundColor: Colors.red.shade600,
    behavior: SnackBarBehavior.floating,
    padding: const EdgeInsets.all(20.0),
    dismissDirection: DismissDirection.horizontal,
    shape: const RoundedRectangleBorder(
        borderRadius:
        BorderRadius.all(Radius.circular(5.0))),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);

}
void dismissKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

