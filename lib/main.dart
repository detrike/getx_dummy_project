import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/app_binding.dart';
import 'controllers/theme_controller.dart';
import 'localization/app_translations.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() {
  AppBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      init: Get.find<ThemeController>(),
      builder: (themeController) {
        return GetMaterialApp(
          translations: AppTranslations(),
          locale: const Locale('en', 'US'),
          fallbackLocale: const Locale('en', 'US'),
          title: 'Student Details'.tr,
          debugShowCheckedModeBanner: true,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          themeMode: themeController.themeMode.value,
          initialRoute: AppRoutes.studentList,
          getPages: AppPages.pages,
        );
      },
    );
  }
}
