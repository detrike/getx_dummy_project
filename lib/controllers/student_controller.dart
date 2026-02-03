import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../models/student.dart';

class StudentController extends GetxController {
  var students = <Student>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadStudents();
  }

  Future<void> loadStudents() async {
    try {
      await Future.delayed(const Duration(seconds: 4));
      isLoading.value = true;
      final String response = await rootBundle.loadString(
        'assets/students.json',
      );
      final List<dynamic> data = json.decode(response);

      students.value = data.map((e) => Student.fromJson(e)).toList();
    } catch (e) {
      print("Error loading students: $e");
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}
