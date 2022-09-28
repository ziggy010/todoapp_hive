import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'pages/homepage.dart';

void main() async {
  await Hive.initFlutter();

  //Open box for hive

  var box = await Hive.openBox('myBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 851),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: HomePage(),
          ),
        );
      },
    );
  }
}
