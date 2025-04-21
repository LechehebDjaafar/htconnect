import 'package:flutter/material.dart';

class AvailableJobsScreen extends StatelessWidget {
  const AvailableJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildSearch(),
          const SizedBox(height: 16),
          _buildCategories(),
          const SizedBox(height: 16),
          _buildJobsList(),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'ابحث عن عمل...',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () {},
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        filled: true,
        fillColor: Colors.grey[100],
      ),
    );
  }

  Widget _buildCategories() {
    final categories = [
      {'icon': Icons.construction, 'name': 'صيانة'},
      {'icon': Icons.cleaning_services, 'name': 'تنظيف'},
      {'icon': Icons.delivery_dining, 'name': 'توصيل'},
      {'icon': Icons.home_repair_service, 'name': 'خدمات منزلية'},
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 100,
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      categories[index]['icon'] as IconData,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      categories[index]['name'] as String,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildJobsList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => _buildJobCard(index),
      ),
    );
  }

  Widget _buildJobCard(int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: Colors.orange[100],
          child: const Icon(Icons.work, color: Colors.orange),
        ),
        title: Text('عمل ${index + 1}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.attach_money, size: 16),
                Text('1000 د.ج / يوم'),
                Spacer(),
                Icon(Icons.access_time, size: 16),
                Text('8 ساعات'),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.location_on, size: 16),
                Text('الجزائر العاصمة'),
              ],
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'التفاصيل:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text('• خبرة في مجال الصيانة'),
                const Text('• توفر أدوات العمل'),
                const Text('• إمكانية العمل في عطلة نهاية الأسبوع'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.send),
                      label: const Text('تقدم للعمل'),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.person),
                      label: const Text('تواصل مع صاحب العمل'),
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
}
