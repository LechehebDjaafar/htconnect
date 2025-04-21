import 'package:flutter/material.dart';

class PerformanceScreen extends StatelessWidget {
  const PerformanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildPerformanceOverview(),
          const SizedBox(height: 16),
          _buildEmployeeEvaluations(),
        ],
      ),
    );
  }

  Widget _buildPerformanceOverview() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ملخص الأداء',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildPerformanceIndicator('ممتاز', 0.3, Colors.green),
                _buildPerformanceIndicator('جيد', 0.45, Colors.blue),
                _buildPerformanceIndicator('متوسط', 0.15, Colors.orange),
                _buildPerformanceIndicator('ضعيف', 0.1, Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceIndicator(String label, double value, Color color) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: CircularProgressIndicator(
                value: value,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(color),
                strokeWidth: 8,
              ),
            ),
            Text(
              '${(value * 100).toInt()}%',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  Widget _buildEmployeeEvaluations() {
    return Expanded(
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: const Text('تقييمات الموظفين'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.sort),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return _buildEvaluationCard(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEvaluationCard(int index) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text('${index + 1}'),
        ),
        title: Text('موظف ${index + 1}'),
        subtitle: const Text('قسم تطوير البرمجيات'),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildRatingRow('الأداء الوظيفي', 4.5),
                _buildRatingRow('المهارات القيادية', 4.0),
                _buildRatingRow('العمل الجماعي', 4.8),
                _buildRatingRow('الالتزام', 4.2),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                      label: const Text('تعديل التقييم'),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.history),
                      label: const Text('سجل التقييمات'),
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

  Widget _buildRatingRow(String label, double rating) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 20,
              );
            }),
          ),
        ],
      ),
    );
  }
}
