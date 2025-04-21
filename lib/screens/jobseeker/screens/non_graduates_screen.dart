import 'package:flutter/material.dart';

class NonGraduatesScreen extends StatelessWidget {
  const NonGraduatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildSkillsSection(),
          const SizedBox(height: 16),
          _buildAvailableJobs(),
          const SizedBox(height: 16),
          Expanded(
            child: _buildJobsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'المهارات المطلوبة',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildSkillChip('حرفي'),
                _buildSkillChip('سائق'),
                _buildSkillChip('عامل بناء'),
                _buildSkillChip('حارس'),
                _buildSkillChip('عامل نظافة'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.blue[50],
    );
  }

  Widget _buildAvailableJobs() {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(right: 16),
            child: Container(
              width: 200,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'وظيفة متاحة',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('الأجر: ${1000 + index * 500} دج'),
                  const Text('المكان: الجزائر العاصمة'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildJobsList() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green[100],
              child: const Icon(Icons.work, color: Colors.green),
            ),
            title: Text('وظيفة ${index + 1}'),
            subtitle: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('متطلبات العمل: خبرة سنة'),
                Text('نوع العمل: دوام كامل'),
              ],
            ),
            trailing: ElevatedButton(
              onPressed: () {},
              child: const Text('تقدم'),
            ),
          ),
        );
      },
    );
  }
}
