import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButtons extends StatelessWidget {
  final String buttonText;
  VoidCallback onTap;
  final Color buttonColor;

  MyButtons({
    required this.buttonText,
    required this.onTap,
    required this.buttonColor,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 120.w,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(
            12.r,
          ),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'poppins',
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
