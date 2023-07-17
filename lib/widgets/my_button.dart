// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyBtn extends StatelessWidget {
  final String btnName;
  Widget? prefixIcon;
  Color? btnBgColor;
  Color? btnColor;
  TextStyle? textStyle;
  VoidCallback? onPressed;

  MyBtn(
      {super.key,
      required this.btnName,
      this.prefixIcon,
      this.btnBgColor,
      this.btnColor,
      this.textStyle,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed!();
      },
      child: prefixIcon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                prefixIcon!,
                SizedBox(width: 10),
                Text(btnName, style: textStyle)
              ],
            )
          : Text(btnName, style: textStyle),
      style: ElevatedButton.styleFrom(
        foregroundColor: btnColor ?? Colors.white,
         backgroundColor: btnBgColor ?? Colors.black,
        shadowColor: btnColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
