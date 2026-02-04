import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../models/student.dart';

class StudentController extends GetxController {
  var students = <Student>[].obs;
  var isLoading = true.obs;
  final selectedGrade = RxnString();

  @override
  void onInit() {
    super.onInit();
    loadStudents();
  }

  List<Student> get visibleStudents {
    final grade = selectedGrade.value;
    if (grade == null) return students;
    return students.where((s) => s.grade == grade).toList();
  }

  Future<bool> loadStudents() async {
    bool success = false;
    try {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 4));
      final String response = await rootBundle.loadString(
        'assets/students.json',
      );
      final List<dynamic> data = json.decode(response);

      students.value = data.map((e) => Student.fromJson(e)).toList();
      success = true;
    } catch (e) {
      print("Error loading students: $e");
      success = false;
    } finally {
      isLoading.value = false;
    }
    return success;
  }

  void clearFilter() => selectedGrade.value = null;

  void setFilter(String grade) {
    selectedGrade.value = grade;
  }

  void addStudent(Student student) {
    students.add(student);
  }
}
