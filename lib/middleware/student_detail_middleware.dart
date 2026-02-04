import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/student.dart';
import '../routes/app_routes.dart';

class StudentDetailMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    log('jsonEncode:: ${Get.arguments}');
    final args = Get.arguments;

    // If argument is missing or not a Student, redirect to the list page.
    log('rgs is! Student : ${args is Student}');
    if (args is! Student) {
      return const RouteSettings(name: AppRoutes.studentList);
    }

    return null; // allow navigation
  }
}

