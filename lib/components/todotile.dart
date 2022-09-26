import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToDoTile extends StatelessWidget {
  final String todoText;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  ToDoTile({
    required this.todoText,
    required this.taskCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 32.w,
        vertical: 14.h,
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(
          8.sm,
        ),
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade700,
          borderRadius: BorderRadius.circular(
            8.r,
          ),
        ),
        child: Row(
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
            ),
            Text(
              todoText,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'poppins',
                fontSize: 15.sp,
                decoration: taskCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                decorationThickness: 2.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
