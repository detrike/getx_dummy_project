import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/student_controller.dart';

class StudentListView extends StatelessWidget {
  final StudentController controller = Get.put(StudentController());

  StudentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Details"), centerTitle: true),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.students.isEmpty) {
          return Center(child: Text("No students found"));
        }

        return ListView.builder(
          itemCount: controller.students.length,
          itemBuilder: (context, index) {
            final student = controller.students[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              elevation: 3,
              child: ListTile(
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
    );
  }
}
