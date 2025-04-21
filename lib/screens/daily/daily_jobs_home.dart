import 'package:flutter/material.dart';
import 'screens/available_jobs_screen.dart';
import 'screens/post_job_screen.dart';

class DailyJobsHome extends StatefulWidget {
  const DailyJobsHome({super.key});

  @override
  State<DailyJobsHome> createState() => _DailyJobsHomeState();
}

class _DailyJobsHomeState extends State<DailyJobsHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الأعمال اليومية'),
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
          tabs: const [
            Tab(
              icon: Icon(Icons.work_outline),
              text: 'الوظائف المتاحة',
            ),
            Tab(
              icon: Icon(Icons.post_add),
              text: 'إضافة عمل',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          AvailableJobsScreen(),
          PostJobScreen(),
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
