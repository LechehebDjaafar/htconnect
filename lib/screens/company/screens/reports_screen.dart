import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildDateRangePicker(),
          const SizedBox(height: 16),
          _buildStatisticsGrid(),
          const SizedBox(height: 24),
          _buildRecruitmentProgress(),
          const SizedBox(height: 24),
          _buildDepartmentStats(),
          const SizedBox(height: 24),
          _buildRecentActivities(),
        ],
      ),
    );
  }

  Widget _buildDateRangePicker() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.calendar_today),
            const SizedBox(width: 16),
            const Text('فترة التقرير'),
            const Spacer(),
            DropdownButton<String>(
              value: 'month',
              items: const [
                DropdownMenuItem(value: 'week', child: Text('الأسبوع الحالي')),
                DropdownMenuItem(value: 'month', child: Text('الشهر الحالي')),
                DropdownMenuItem(value: 'quarter', child: Text('الربع الحالي')),
                DropdownMenuItem(value: 'year', child: Text('السنة الحالية')),
              ],
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: [
        _buildStatCard('إجمالي الوظائف', '125', Icons.work, Colors.blue),
        _buildStatCard('المتقدمين', '543', Icons.people, Colors.green),
        _buildStatCard('المقابلات', '89', Icons.calendar_today, Colors.orange),
        _buildStatCard('التوظيفات', '32', Icons.check_circle, Colors.purple),
      ],
    );
  }

  Widget _buildStatCard(
      String title, String value, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: color, size: 32),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }

  Widget _buildRecruitmentProgress() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'تقدم التوظيف',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildProgressBar('تم التقديم', 0.8, Colors.blue),
            const SizedBox(height: 8),
            _buildProgressBar('تمت المراجعة', 0.6, Colors.orange),
            const SizedBox(height: 8),
            _buildProgressBar('تمت المقابلة', 0.4, Colors.purple),
            const SizedBox(height: 8),
            _buildProgressBar('تم التوظيف', 0.2, Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar(String label, double value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Text('${(value * 100).toInt()}%'),
          ],
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: value,
          backgroundColor: color.withOpacity(0.2),
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      ],
    );
  }

  Widget _buildDepartmentStats() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'التوظيف حسب القسم',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildDepartmentItem('تطوير البرمجيات', 45, Colors.blue),
            _buildDepartmentItem('التسويق', 30, Colors.green),
            _buildDepartmentItem('الموارد البشرية', 15, Colors.orange),
            _buildDepartmentItem('المبيعات', 25, Colors.purple),
          ],
        ),
      ),
    );
  }

  Widget _buildDepartmentItem(String name, int count, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(name),
          const Spacer(),
          Text('$count'),
        ],
      ),
    );
  }

  Widget _buildRecentActivities() {
    return Card(
      child: Column(
        children: [
          const ListTile(
            title: Text('النشاطات الأخيرة'),
            trailing: Icon(Icons.access_time),
          ),
          const Divider(),
          _buildActivityItem(
            'تم قبول مرشح جديد',
            'قسم تطوير البرمجيات',
            Icons.check_circle,
            Colors.green,
          ),
          _buildActivityItem(
            'تمت إضافة وظيفة جديدة',
            'مدير مشروع',
            Icons.work,
            Colors.blue,
          ),
          _buildActivityItem(
            'تم جدولة 3 مقابلات',
            'الأسبوع القادم',
            Icons.calendar_today,
            Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(
      String title, String subtitle, IconData icon, Color color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.2),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Text('اليوم'),
    );
  }
}
