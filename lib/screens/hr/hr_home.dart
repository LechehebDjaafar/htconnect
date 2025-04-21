import 'package:flutter/material.dart';
import 'screens/recruitment_screen.dart';
import 'screens/training_screen.dart';
import 'screens/performance_screen.dart';
import 'screens/interviews_screen.dart';

class HRHome extends StatefulWidget {
  const HRHome({super.key});

  @override
  State<HRHome> createState() => _HRHomeState();
}

class _HRHomeState extends State<HRHome> with SingleTickerProviderStateMixin {
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
        title: const Text('إدارة الموارد البشرية'),
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
              icon: Icon(Icons.person_search),
              text: 'التوظيف',
            ),
            Tab(
              icon: Icon(Icons.school),
              text: 'التدريب',
            ),
            Tab(
              icon: Icon(Icons.assessment),
              text: 'تقييم الأداء',
            ),
            Tab(
              icon: Icon(Icons.calendar_today),
              text: 'المقابلات',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          RecruitmentScreen(),
          TrainingScreen(),
          PerformanceScreen(),
          InterviewsScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // إضافة عنصر جديد حسب التبويب الحالي
          switch (_tabController.index) {
            case 0:
              _addNewJob();
              break;
            case 1:
              _addNewTraining();
              break;
            case 2:
              _addNewEvaluation();
              break;
            case 3:
              _addNewInterview();
              break;
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addNewJob() {
    // إضافة وظيفة جديدة
  }

  void _addNewTraining() {
    // إضافة دورة تدريبية جديدة
  }

  void _addNewEvaluation() {
    // إضافة تقييم جديد
  }

  void _addNewInterview() {
    // إضافة مقابلة جديدة
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
