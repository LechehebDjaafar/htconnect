import 'package:flutter/material.dart';

class RecruitmentScreen extends StatelessWidget {
  const RecruitmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildStatisticsCards(),
          const SizedBox(height: 16),
          _buildCandidatesSection(),
        ],
      ),
    );
  }

  Widget _buildStatisticsCards() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1.5,
      children: [
        _buildStatCard('طلبات التوظيف', '28', Colors.blue),
        _buildStatCard('المقابلات اليوم', '5', Colors.green),
        _buildStatCard('الوظائف الشاغرة', '12', Colors.orange),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(title),
          ],
        ),
      ),
    );
  }

  Widget _buildCandidatesSection() {
    return Expanded(
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: const Text('المرشحون للوظائف'),
              trailing: IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () {},
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text('مرشح ${index + 1}'),
                    subtitle: const Text('مهندس برمجيات'),
                    trailing: PopupMenuButton(
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'view',
                          child: Text('عرض السيرة الذاتية'),
                        ),
                        const PopupMenuItem(
                          value: 'schedule',
                          child: Text('جدولة مقابلة'),
                        ),
                        const PopupMenuItem(
                          value: 'reject',
                          child: Text('رفض'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
