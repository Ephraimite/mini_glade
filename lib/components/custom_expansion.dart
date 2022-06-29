import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mini_glade/constants/colors.dart';

class CustomExpansionTile extends StatefulWidget {
  final String header;
  final String leadingImage;
  final List<Widget> children;

  CustomExpansionTile(
      {required this.header,
        required this.leadingImage,
        required this.children});

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 4,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ExpansionTile(
              maintainState: true,
              trailing: isExpanded
                  ? Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: lightGrey),
                child: Icon(
                  CupertinoIcons.chevron_down,
                  size: 15,
                  color: colorPrimary,
                ),
              )
                  : Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: lightGrey),
                child: Icon(
                  CupertinoIcons.chevron_up,
                  size: 15,
                  color: colorPrimary,
                ),
              ),
              expandedAlignment: Alignment.centerLeft,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: widget.children),
                )
              ],
              title: Row(
                children: [
                  Image.asset(
                    widget.leadingImage,
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    widget.header,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: blackColor),
                  ),
                ],
              ),
              onExpansionChanged: (expanding) =>
                  setState(() => isExpanded = expanding),
            ),
          ),
        ],
      ),
    );
  }
}