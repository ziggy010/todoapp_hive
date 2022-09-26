import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp_hive/components/myButtons.dart';

class AlertDialogComponents extends StatelessWidget {
  final controller;

  AlertDialogComponents({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        padding: EdgeInsets.all(
          20.sm,
        ),
        height: 200.h,
        color: Colors.deepPurple,
        child: Column(
          children: [
            TextField(
              controller: controller,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'poppins',
                decoration: TextDecoration.none,
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add task',
                hintStyle: TextStyle(
                  fontFamily: 'poppins',
                ),
                focusedBorder: OutlineInputBorder(),
              ),
              cursorColor: Colors.white,
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                MyButtons(
                  buttonText: 'Cancel',
                  onTap: () {},
                  buttonColor: Colors.red,
                ),
                SizedBox(
                  width: 12.w,
                ),
                MyButtons(
                  buttonText: 'Save',
                  onTap: () {},
                  buttonColor: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
