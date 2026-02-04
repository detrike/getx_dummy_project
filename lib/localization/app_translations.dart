import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'app_title': 'Student Details',
          'students_title': 'Student Details',
          'reload_title': 'Reload?',
          'reload_message': 'Reload student list from assets?',
          'yes': 'Yes',
          'no': 'No',
          'refreshed': 'Refreshed',
          'refreshed_message': 'Student list updated',
          'error': 'Error',
          'error_message': 'Failed to load students',
          'no_students': 'No students found',
          'all_grades': 'All grades',
          'grade_prefix': 'Grade',
          'add_student': 'Add Student',
        },
        'hi_IN': {
          'app_title': 'विद्यार्थी विवरण',
          'students_title': 'विद्यार्थी विवरण',
          'reload_title': 'रीलोड करें?',
          'reload_message': 'छात्रों की सूची फिर से लोड करें?',
          'yes': 'हाँ',
          'no': 'नहीं',
          'refreshed': 'रीफ्रेश हुआ',
          'refreshed_message': 'छात्र सूची अपडेट हो गई',
          'error': 'त्रुटि',
          'error_message': 'छात्रों को लोड करने में विफल',
          'no_students': 'कोई छात्र नहीं मिला',
          'all_grades': 'सभी ग्रेड',
          'grade_prefix': 'ग्रेड',
          'add_student': 'नया छात्र जोड़ें',
        },
      };
}

