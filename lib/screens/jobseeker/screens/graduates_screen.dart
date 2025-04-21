import 'package:flutter/material.dart';

class GraduatesScreen extends StatelessWidget {
  const GraduatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildSearchBar(),
          const SizedBox(height: 16),
          _buildFilters(),
          const SizedBox(height: 16),
          Expanded(
            child: _buildJobsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'ابحث عن وظيفة...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        filled: true,
        fillColor: Colors.grey[100],
      ),
    );
  }

  Widget _buildFilters() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FilterChip(
            label: const Text('هندسة'),
            onSelected: (bool selected) {},
          ),
          const SizedBox(width: 8),
          FilterChip(
            label: const Text('طب'),
            onSelected: (bool selected) {},
          ),
          const SizedBox(width: 8),
          FilterChip(
            label: const Text('تعليم'),
            onSelected: (bool selected) {},
          ),
          // يمكن إضافة المزيد من التصنيفات
        ],
      ),
    );
  }

  Widget _buildJobsList() {
    return ListView.builder(
      itemCount: 10, // عدد مؤقت للعرض
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue[100],
              child: const Icon(Icons.work, color: Colors.blue),
            ),
            title: const Text('مهندس برمجيات'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('شركة التقنية المتقدمة'),
                Row(
                  children: const [
                    Icon(Icons.location_on, size: 16),
                    Text('الجزائر العاصمة'),
                    Spacer(),
                    Icon(Icons.access_time, size: 16),
                    Text('دوام كامل'),
                  ],
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.bookmark_border),
              onPressed: () {},
            ),
            onTap: () {
              // عرض تفاصيل الوظيفة
            },
          ),
        );
      },
    );
  }
}
