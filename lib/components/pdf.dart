import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mini_glade/models/send_money_response.dart';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfUtil {
  final BuildContext context;

  PdfUtil(this.context);

  pw.ImageProvider? image;
  pw.ImageProvider? backgroundImage;

  final pw.Document pdf = pw.Document();

  static writeOnPdf(
      BuildContext context, var page, String documentName, pw.Document pdf,
      [bool isDownloadOnly = false]) async {
    pdf.addPage(page);

    if (isDownloadOnly) {
      final output = await getApplicationDocumentsDirectory();
      final file = File('${output.path}/$documentName.pdf');
      await file.writeAsBytes(await pdf.save());

      OpenFile.open(file.path);
      return;
    } else
      Printing.sharePdf(bytes: await pdf.save(), filename: '$documentName.pdf');
  }

  downloadAndShareStatement(
      BuildContext context, SendMoneyModel sendmoneyModel,
      [bool isDownloadOnly = false]) async {
    image = pw.MemoryImage(
      (await rootBundle.load("assets/images/black_logo.png"))
          .buffer
          .asUint8List(),
    );

    backgroundImage = pw.MemoryImage(
      (await rootBundle.load("assets/images/black_g.png")).buffer.asUint8List(),
    );

    pw.ThemeData themeData = pw.ThemeData();
    writeOnPdf(context, _singlePage(themeData, sendmoneyModel),
        "Glade Receipt-${sendmoneyModel.transactionDate}", pdf, isDownloadOnly);
  }

  pw.Page _singlePage(pw.ThemeData theme, SendMoneyModel sendmoneyModel) {
    return pw.Page(
        theme: theme,
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Container(
              decoration: const pw.BoxDecoration(),
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
                  pw.Center(
                      child: pw.Image(
                    image!,
                    width: 200.0,
                    height: 200,
                  )),
                  pw.SizedBox(
                    height: 30.0,
                  ),
                  pw.Center(
                      child: pw.Text("Transaction Receipt",
                          style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.red,
                              fontWeight: pw.FontWeight.bold))),
                  pw.SizedBox(
                    height: 10.0,
                  ),
                  pw.Divider(color: PdfColors.black, height: 2),
                  pw.SizedBox(
                    height: 30.0,
                  ),
                  pw.SizedBox(
                    height: 10.0,
                  ),
                  pw.Column(
                    children: [
                      transactionHistoryItem("Transaction status", "${sendmoneyModel.status}"),
                      transactionHistoryItem("Transaction Date", "${sendmoneyModel.transactionDate}"),
                      transactionHistoryItem("Transaction reference", "${sendmoneyModel.txnRef}"),
                      transactionHistoryItem("Sender name", "${sendmoneyModel.senderName}"),
                      transactionHistoryItem("Beneficiary name", "${sendmoneyModel.beneficiaryName}"),
                      transactionHistoryItem("Transaction Amount", "${sendmoneyModel.transactionAmount}"),
                      transactionHistoryItem("Narration", "${sendmoneyModel.narration}"),
                      transactionHistoryItem("Account Number", "${sendmoneyModel.accountNumber}"),
                      transactionHistoryItem("Receiving Bank", "${sendmoneyModel.receivingBank}"),
                    ]
                  )
                ],
              ));
        });
  }

  transactionHistoryItem(String itemName, String itemValue) {
    return pw.Padding(
      padding: pw.EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        children: <pw.Widget>[
          pw.Expanded(
            child: pw.Text("$itemName: ",
                style: pw.TextStyle(
                    fontSize: 20.sp,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.red)),
          ),
          pw.SizedBox(width: 100.w),
          pw.Expanded(
            flex: 1,
            child: pw.Text("$itemValue",
                style: pw.TextStyle(
                    fontSize: 20.sp,
                    color: PdfColors.black,
                    fontWeight: pw.FontWeight.bold)),
          ),
          pw.SizedBox(height: 10.h),
        ],
      ),
    );
  }

}
