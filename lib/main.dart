import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/student_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Student Details',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: StudentListView(),
    );
  }
}
