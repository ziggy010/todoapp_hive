import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp_hive/components/AlertDialog.dart';
import 'package:todoapp_hive/model/ToDoModel.dart';

import '../components/todotile.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text edition controller

  final _controller = TextEditingController();

  List<ToDoModel> todoList = [
    ToDoModel(todoText: 'To exercise', taskStatus: false),
    ToDoModel(todoText: 'To drink water', taskStatus: false),
    ToDoModel(todoText: 'To bath', taskStatus: false),
  ];

  changeStatus(int index, bool? value) {
    setState(() {
      todoList[index].taskStatus = !todoList[index].taskStatus;
    });
  }

  void addTask() {
    showDialog(
      context: context,
      builder: ((context) {
        return AlertDialogComponents(
          controller: _controller,
          onSave: () {
            setState(() {
              todoList.add(
                ToDoModel(
                  todoText: _controller.text,
                  taskStatus: false,
                ),
              );
            });

            Navigator.of(context).pop();
          },
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
            todoText: todoList[index].todoText,
            taskCompleted: todoList[index].taskStatus,
            onChanged: (Value) {
              changeStatus(index, Value);
            },
          );
        },
      ),
    );
  }
}
