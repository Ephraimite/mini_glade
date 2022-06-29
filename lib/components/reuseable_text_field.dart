import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_glade/constants/colors.dart';

// class ReuseableTextField extends StatelessWidget {
//   final String? label;
//   final TextInputType? keyboardType;
//   final bool? obscureText;
//   final String? hintText;
//   final Function(String)? onChanged;
//   final Function()? onTap;
//   final int? maxLength;
//   final TextEditingController? textEditingController;
//   final dynamic validateFn;
//   final bool shouldReadOnly;
//   final TextInputFormatter? formatter;
//   final bool? enabled;
//
//   ReuseableTextField(
//       {this.label,
//       this.keyboardType,
//       this.obscureText,
//       this.hintText,
//       this.onChanged,
//       this.onTap,
//       this.maxLength,
//       this.textEditingController,
//       this.validateFn, this.shouldReadOnly = false, this.enabled,
//       this.formatter});
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       enabled: enabled,
//       controller: textEditingController,
//       maxLength: this.maxLength,
//       onTap: onTap ?? null,
//       onChanged: (text) {
//         if (onChanged != null) onChanged!(text);
//       },
//       cursorColor: colorPrimary,
//       keyboardType: keyboardType,
//       obscureText: obscureText ?? false,
//       readOnly: shouldReadOnly,
//       inputFormatters: [
//         formatter ?? FilteringTextInputFormatter.singleLineFormatter
//       ],
//       decoration: InputDecoration(
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10.r),
//               borderSide: BorderSide(width: 1.0.w, color: Colors.black45)),
//           hintText: hintText,
//           contentPadding: const EdgeInsets.all(10),
//           hintStyle: TextStyle(fontSize: 14.sp),
//           focusedBorder: const OutlineInputBorder(
//               borderSide: BorderSide(color: textFieldBorderColor, width: 1.5),
//               borderRadius: BorderRadius.all(Radius.circular(5.0))),
//           enabledBorder: const OutlineInputBorder(
//               borderSide: BorderSide(color: textFieldBorderColor, width: 1.5),
//               borderRadius: BorderRadius.all(Radius.circular(5.0)))),
//     );
//   }
// }
class ReuseableTextField extends StatelessWidget {
  final Widget? prefixIcon;

  final String? label;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String? hintText;
  final Function(String)? onChanged;
  final Function()? onTap;
  final int? maxLength;
  final TextEditingController? textEditingController;
  final dynamic validateFn;
  final bool shouldReadOnly;
  final TextInputFormatter? formatter;
  final bool? enabled;

  ReuseableTextField({
    this.label,
    this.onChanged,
    this.onTap,
    this.prefixIcon,
    this.keyboardType,
    this.obscureText,
    this.hintText,
    this.maxLength,
    this.textEditingController,
    this.formatter,
    this.validateFn,
    this.shouldReadOnly = false, this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) ...[
            Text(
              label!,
              style: TextStyle(
                  fontSize: 14.0.sp,
                  // color: Colors.black45,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 1.0.h),
          ],
          TextFormField(
            enabled: enabled,
            controller: textEditingController,
            maxLength: this.maxLength,
            onTap: onTap ?? null,
            onChanged: (text) {
              if (onChanged != null) onChanged!(text);
            },
            cursorColor: Colors.black45,
            keyboardType: keyboardType,
            obscureText: obscureText ?? false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validateFn,
            style: TextStyle(
                fontSize: 14.0.sp,
                color: Colors.black45,
                fontWeight: FontWeight.w500),
            readOnly: shouldReadOnly,
            inputFormatters: [
              formatter ?? FilteringTextInputFormatter.singleLineFormatter
            ],
            decoration: InputDecoration(
                counterText: "",
                hintText: hintText,
                contentPadding: const EdgeInsets.only(
                  left: 8.0,
                  top: 19.0,
                ),
                prefixIcon: prefixIcon == null
                    ? null
                    : Container(
                    height: 3.h,
                    width: 3.w,
                    padding: EdgeInsets.all(15.0),
                    child: prefixIcon),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: textFieldBorderColor,
                        width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: textFieldBorderColor,
                        width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)))),
          )
        ],
      ),
    );
  }
}
