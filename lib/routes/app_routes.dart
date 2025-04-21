import 'package:flutter/material.dart';
import '../screens/jobseeker/jobseeker_home.dart';
import '../screens/company/company_home.dart';
import '../screens/hr/hr_home.dart';
import '../screens/daily/daily_jobs_home.dart';
import '../screens/auth/login_screen.dart';

class AppRoutes {
  static String getInitialRoute(String userType) {
    switch (userType) {
      case 'jobseeker':
        return '/jobseeker';
      case 'employer':
        return '/company';
      case 'hr':
        return '/hr';
      default:
        return '/jobseeker';
    }
  }

  static final Map<String, WidgetBuilder> routes = {
    '/jobseeker': (context) => const JobSeekerHome(),
    '/company': (context) => const CompanyHome(),
    '/hr': (context) => const HRHome(),
    '/daily-jobs': (context) => const DailyJobsHome(),
    '/login': (context) => const LoginScreen(userType: ''),
  };
}
