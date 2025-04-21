import 'package:flutter/material.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildActiveTrainings(),
          const SizedBox(height: 16),
          _buildTrainingCalendar(),
        ],
      ),
    );
  }

  Widget _buildActiveTrainings() {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(right: 16),
            child: Container(
              width: 300,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue[100],
                        child: const Icon(Icons.school),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'دورة تدريبية',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text('اسم الدورة ${index + 1}'),
                  const Text('عدد المشاركين: 15'),
                  const Text('المدة: 4 أسابيع'),
                  const LinearProgressIndicator(value: 0.6),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTrainingCalendar() {
    return Expanded(
      child: Card(
        child: Column(
          children: [
            const ListTile(
              title: Text('جدول التدريب'),
              trailing: Icon(Icons.calendar_today),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green[100],
                      child: Text('${index + 1}'),
                    ),
                    title: Text('تدريب ${index + 1}'),
                    subtitle: const Text('10:00 صباحاً - قاعة التدريب'),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      child: const Text('إدارة'),
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
