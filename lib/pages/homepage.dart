import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp_hive/components/AlertDialog.dart';
import 'package:todoapp_hive/data/database.dart';
import 'package:todoapp_hive/model/ToDoModel.dart';

import '../components/todotile.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Hive box reference;

  final _myBox = Hive.box('myBox');

  //text edition controller

  final _controller = TextEditingController();

  //referencing database class

  ToDoDatabase db = ToDoDatabase();

  changeStatus(int index, bool? value) {
    setState(() {
      db.todoList[index].taskStatus = !db.todoList[index].taskStatus;
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
              db.todoList.add(
                ToDoModel(
                  todoText: _controller.text,
                  taskStatus: false,
                ),
              );
            });

            Navigator.of(context).pop();
            _controller.clear();
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
      body: db.todoList.length != 0
          ? ListView.builder(
              itemCount: db.todoList.length,
              itemBuilder: (BuildContext context, int index) {
                return ToDoTile(
                  todoText: db.todoList[index].todoText,
                  taskCompleted: db.todoList[index].taskStatus,
                  onChanged: (Value) {
                    changeStatus(index, Value);
                  },
                  onDelete: (context) {
                    setState(() {
                      db.todoList.removeAt(index);
                    });
                  },
                );
              },
            )
          : Center(
              child: Padding(
                padding: EdgeInsets.all(
                  15.0.sm,
                ),
                child: Text(
                  'Please add your to do list to show here!',
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'poppins',
                    fontSize: 25.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
    );
  }
}
