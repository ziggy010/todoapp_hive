import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp_hive/components/AlertDialog.dart';

import '../components/todotile.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text edition controller

  final _controller = TextEditingController();

  List todoList = [
    ['To exercise', false],
    ['To drink water', false],
  ];

  changeStatus(int index, bool? value) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void addTask() {
    showDialog(
      context: context,
      builder: ((context) {
        return AlertDialogComponents(
          controller: _controller,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade500,
        elevation: 0,
        title: Center(
          child: Text(
            'Todo List',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontFamily: 'poppins',
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        backgroundColor: Colors.deepPurple,
        child: Icon(
          Icons.add,
        ),
      ),
      backgroundColor: Colors.deepPurple.shade400,
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return ToDoTile(
            todoText: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (Value) {
              changeStatus(index, Value);
            },
          );
        },
      ),
    );
  }
}
