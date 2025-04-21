import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'screens/onboarding/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HRConnect',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingScreen(),
        ...AppRoutes.routes,
      },
      locale: const Locale('ar'),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    JobSeekersScreen(),
    CompaniesScreen(),
    HRManagementScreen(),
    DailyJobsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 40,
            ),
            const SizedBox(width: 8),
            const Text('HRConnect'),
          ],
        ),
        centerTitle: true,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_search),
            label: 'الباحثين عن عمل',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'المؤسسات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'الموارد البشرية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'الأعمال اليومية',
          ),
        ],
      ),
    );
  }
}

// Placeholder screens - تعريف مؤقت للشاشات
class JobSeekersScreen extends StatelessWidget {
  const JobSeekersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الباحثين عن عمل'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _buildCategoryCard(
              context,
              'أصحاب الشهادات',
              Icons.school,
              Colors.blue,
              () => _navigateToForm(context, 'graduates'),
            ),
            _buildCategoryCard(
              context,
              'بدون شهادات',
              Icons.work,
              Colors.green,
              () => _navigateToForm(context, 'non_graduates'),
            ),
            _buildCategoryCard(
              context,
              'ذوو الاحتياجات الخاصة',
              Icons.accessible,
              Colors.orange,
              () => _navigateToForm(context, 'special_needs'),
            ),
            _buildCategoryCard(
              context,
              'إعادة إدماج',
              Icons.refresh,
              Colors.purple,
              () => _navigateToForm(context, 'reintegration'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, IconData icon,
      Color color, VoidCallback onTap) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToForm(BuildContext context, String category) {
    // سيتم إضافة التنقل إلى نموذج التسجيل لاحقاً
  }
}

class CompaniesScreen extends StatelessWidget {
  const CompaniesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المؤسسات'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => _navigateToCompanyRegistration(context),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
              ),
              child: const Text('تسجيل مؤسسة جديدة'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _navigateToJobPosting(context),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
              ),
              child: const Text('إضافة وظيفة جديدة'),
            ),
            const SizedBox(height: 24),
            const Text(
              'الوظائف المتاحة',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 0, // سيتم تحديثه لاحقاً عند إضافة الوظائف
                itemBuilder: (context, index) {
                  return const Card(
                    child: ListTile(
                      title: Text('عنوان الوظيفة'),
                      subtitle: Text('وصف الوظيفة'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToJobPosting(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _navigateToCompanyRegistration(BuildContext context) {
    // سيتم إضافة التنقل إلى نموذج تسجيل الشركة
  }

  void _navigateToJobPosting(BuildContext context) {
    // سيتم إضافة التنقل إلى نموذج إضافة وظيفة
  }
}

class HRManagementScreen extends StatelessWidget {
  const HRManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إدارة الموارد البشرية'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'الدورات التدريبية',
              Icons.school,
              Colors.blue,
              [
                'التوظيف الفعال',
                'تقييم الأداء',
                'مهارات القيادة',
                'إدارة فرق العمل',
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'المرشحون للوظائف',
              Icons.people,
              Colors.green,
              [
                'قائمة المرشحين',
                'السير الذاتية',
                'تقييمات المقابلات',
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'جدول المقابلات',
              Icons.calendar_today,
              Colors.orange,
              [
                'المقابلات القادمة',
                'المقابلات السابقة',
                'جدولة مقابلة جديدة',
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // إضافة مقابلة جديدة
        },
        child: const Icon(Icons.add),
        tooltip: 'إضافة مقابلة جديدة',
      ),
    );
  }

  Widget _buildSection(
      String title, IconData icon, Color color, List<String> items) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 24),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...items
                .map((item) => ListTile(
                      title: Text(item),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // التنقل إلى الصفحة المحددة
                      },
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}

class DailyJobsScreen extends StatefulWidget {
  const DailyJobsScreen({super.key});

  @override
  State<DailyJobsScreen> createState() => _DailyJobsScreenState();
}

class _DailyJobsScreenState extends State<DailyJobsScreen>
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
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'الوظائف المتاحة'),
            Tab(text: 'إضافة عمل'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAvailableJobs(),
          _buildAddJobForm(),
        ],
      ),
    );
  }

  Widget _buildAvailableJobs() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5, // عدد مؤقت للعرض
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.work),
            ),
            title: Text('وظيفة ${index + 1}'),
            subtitle: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('المدة: يوم واحد'),
                Text('الأجر: 100 د.ج'),
                Text('الموقع: الجزائر العاصمة'),
              ],
            ),
            isThreeLine: true,
            trailing: ElevatedButton(
              onPressed: () {
                // تقديم طلب للوظيفة
              },
              child: const Text('تقديم'),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAddJobForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'نوع العمل',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'المدة المتوقعة',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'الأجر المقترح',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'موقع العمل',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // حفظ وإضافة العمل
              },
              child: const Text('نشر العمل'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
