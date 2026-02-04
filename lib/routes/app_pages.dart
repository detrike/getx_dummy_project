import 'package:get/get.dart';
import '../bindings/student_binding.dart';

import '../views/add_student_view.dart';
import '../views/student_detail_view.dart';
import '../views/student_list_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = <GetPage<dynamic>>[
    GetPage(
      name: AppRoutes.studentList,
      page: () => StudentListView(),
      binding: StudentBinding(),
    ),
    GetPage(
      name: AppRoutes.studentDetail,
      page: () => const StudentDetailView(),
    ),
    GetPage(name: AppRoutes.addStudent, page: () => const AddStudentView()),
  ];
}
