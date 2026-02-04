import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/student_controller.dart';
import '../controllers/theme_controller.dart';
import '../routes/app_routes.dart';

class StudentListView extends StatelessWidget {
  final StudentController controller = Get.find<StudentController>();
  final ThemeController themeController = Get.find<ThemeController>();

  StudentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('students_title'.tr),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: _toggleLanguage,
          ),
          IconButton(
            icon: Obx(
              () => Icon(
                themeController.isDark ? Icons.light_mode : Icons.dark_mode,
              ),
            ),
            onPressed: themeController.toggleTheme,
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterSheet(context),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _confirmAndRefresh(),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 10),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final students = controller.visibleStudents;

        if (students.isEmpty) {
          return Center(child: Text('no_students'.tr));
        }

        return ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) {
            final student = students[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              elevation: 3,
              child: ListTile(
                onTap: () {
                  Get.toNamed(AppRoutes.studentDetail, arguments: student);
                },
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  child: Text(student.grade),
                ),
                title: Text(
                  student.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("${student.subject} • Age: ${student.age}"),
                trailing: Text("ID: ${student.id}"),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.addStudent),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _confirmAndRefresh() async {
    final confirmed = await Get.defaultDialog<bool>(
      title: 'reload_title'.tr,
      middleText: 'reload_message'.tr,
      textConfirm: 'yes'.tr,
      textCancel: 'no'.tr,
      confirmTextColor: Colors.white,
      onConfirm: () => Get.back(result: true),
      onCancel: () => Get.back(result: false),
    );

    if (confirmed != true) return;

    final success = await controller.loadStudents();
    if (success) {
      Get.snackbar(
        'refreshed'.tr,
        'refreshed_message'.tr,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    } else {
      Get.snackbar(
        'error'.tr,
        'error_message'.tr,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red.withOpacity(0.2),
      );
    }
  }

  void _showFilterSheet(BuildContext context) {
    final grades = controller.students.map((s) => s.grade).toSet().toList()
      ..sort();

    Get.bottomSheet(
      SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.clear),
                title: Text('all_grades'.tr),
                onTap: () {
                  controller.clearFilter();
                  Get.back();
                },
              ),
              for (final grade in grades)
                ListTile(
                  leading: const Icon(Icons.school),
                  title: Text("${'grade_prefix'.tr} $grade"),
                  onTap: () {
                    controller.setFilter(grade);
                    Get.back();
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleLanguage() {
    final current = Get.locale ?? Get.deviceLocale;
    if (current?.languageCode == 'en') {
      Get.updateLocale(const Locale('hi', 'IN'));
    } else {
      Get.updateLocale(const Locale('en', 'US'));
    }
  }
}
