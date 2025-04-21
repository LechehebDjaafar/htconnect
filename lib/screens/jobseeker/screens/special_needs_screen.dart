import 'package:flutter/material.dart';

class SpecialNeedsScreen extends StatelessWidget {
  const SpecialNeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildCategoriesGrid(),
          const SizedBox(height: 16),
          _buildSupportSection(),
          const SizedBox(height: 16),
          Expanded(
            child: _buildAdaptedJobsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesGrid() {
    final categories = [
      {'title': 'وظائف إدارية', 'icon': Icons.computer},
      {'title': 'وظائف فنية', 'icon': Icons.brush},
      {'title': 'وظائف تقنية', 'icon': Icons.build},
      {'title': 'وظائف أخرى', 'icon': Icons.more_horiz},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: InkWell(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  categories[index]['icon'] as IconData,
                  size: 40,
                  color: Colors.orange,
                ),
                const SizedBox(height: 8),
                Text(
                  categories[index]['title'] as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSupportSection() {
    return Card(
      color: Colors.orange[50],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(
              Icons.support_agent,
              size: 40,
              color: Colors.orange,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'بحاجة إلى مساعدة؟',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text('فريق الدعم متواجد للمساعدة'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('اتصل بنا'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdaptedJobsList() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ExpansionTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange[100],
              child: const Icon(Icons.accessibility_new, color: Colors.orange),
            ),
            title: const Text('وظيفة متاحة'),
            subtitle: const Text('مناسبة لذوي الاحتياجات الخاصة'),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('التفاصيل:'),
                    const SizedBox(height: 8),
                    Text('• تجهيزات خاصة متوفرة'),
                    Text('• دعم مستمر'),
                    Text('• مرونة في ساعات العمل'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('تقديم طلب'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
