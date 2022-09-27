import 'package:hive/hive.dart';

import '../model/ToDoModel.dart';

class ToDoDatabase {
  List<ToDoModel> todoList = [];

  //referencing hive database;
  final _myBox = Hive.box('myBox');
}
