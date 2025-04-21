import 'package:flutter/material.dart';
import 'screens/graduates_screen.dart';
import 'screens/non_graduates_screen.dart';
import 'screens/special_needs_screen.dart';
import 'screens/reintegration_screen.dart';

class JobSeekerHome extends StatefulWidget {
  const JobSeekerHome({super.key});

  @override
  State<JobSeekerHome> createState() => _JobSeekerHomeState();
}

class _JobSeekerHomeState extends State<JobSeekerHome>
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
        title: const Text('الباحثين عن عمل'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // إظهار الإشعارات
            },
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
              icon: Icon(Icons.school),
              text: 'أصحاب الشهادات',
            ),
            Tab(
              icon: Icon(Icons.work),
              text: 'بدون شهادات',
            ),
            Tab(
              icon: Icon(Icons.accessible),
              text: 'ذوو الاحتياجات',
            ),
            Tab(
              icon: Icon(Icons.refresh),
              text: 'إعادة إدماج',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          GraduatesScreen(),
          NonGraduatesScreen(),
          SpecialNeedsScreen(),
          ReintegrationScreen(),
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
