import 'package:flutter/material.dart';
import 'screens/company_profile_screen.dart';
import 'screens/jobs_management_screen.dart';
import 'screens/applicants_screen.dart';
import 'screens/reports_screen.dart';

class CompanyHome extends StatefulWidget {
  const CompanyHome({super.key});

  @override
  State<CompanyHome> createState() => _CompanyHomeState();
}

class _CompanyHomeState extends State<CompanyHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('بوابة الشركات'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(
              icon: Icon(Icons.business),
              text: 'الملف التعريفي',
            ),
            Tab(
              icon: Icon(Icons.work),
              text: 'إدارة الوظائف',
            ),
            Tab(
              icon: Icon(Icons.people),
              text: 'المتقدمين',
            ),
            Tab(
              icon: Icon(Icons.analytics),
              text: 'التقارير',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          CompanyProfileScreen(),
          JobsManagementScreen(),
          ApplicantsScreen(),
          ReportsScreen(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
