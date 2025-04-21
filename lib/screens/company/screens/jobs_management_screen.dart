import 'package:flutter/material.dart';

class JobsManagementScreen extends StatelessWidget {
  const JobsManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildJobsStatistics(),
          const SizedBox(height: 16),
          _buildJobsList(),
        ],
      ),
    );
  }

  Widget _buildJobsStatistics() {
    return Container(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildStatCard('الوظائف النشطة', '12', Colors.green),
          _buildStatCard('المتقدمين الجدد', '45', Colors.blue),
          _buildStatCard('المقابلات اليوم', '5', Colors.orange),
          _buildStatCard('تم التوظيف', '8', Colors.purple),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Card(
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(16),
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
            const SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }

  Widget _buildJobsList() {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'قائمة الوظائف',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.filter_list),
                label: const Text('تصفية'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => _buildJobCard(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJobCard(int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[50],
          child: const Icon(Icons.work, color: Colors.blue),
        ),
        title: Text('وظيفة ${index + 1}'),
        subtitle: Row(
          children: const [
            Icon(Icons.location_on, size: 16),
            Text(' الجزائر العاصمة'),
            SizedBox(width: 16),
            Icon(Icons.access_time, size: 16),
            Text(' دوام كامل'),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildJobDetail('المتطلبات', 'خبرة 3 سنوات في المجال'),
                _buildJobDetail('الراتب', '50,000 - 70,000 د.ج'),
                _buildJobDetail('عدد المتقدمين', '15 متقدم'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                      label: const Text('تعديل'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.people),
                      label: const Text('المتقدمين'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.close),
                      label: const Text('إغلاق'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJobDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}
