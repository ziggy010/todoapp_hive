import 'package:hive/hive.dart';

import '../model/ToDoModel.dart';

class ToDoDatabase {
  List<ToDoModel> todoList = [];

  List commitList = [];

  //referencing hive database;
  final _myBox = Hive.box('myBox');

  // creating method if the app is opened for the first time.

  void initializeData() {
    todoList = [
      ToDoModel(todoText: 'Add 1 task', taskStatus: false),
    ];
  }

  //load database
  void loadData() {
    todoList = _myBox.get('TODOLIST');
  }

  //update database
  void updateDatabase() {
    _myBox.put('TODOLIST', todoList);
  }
}
