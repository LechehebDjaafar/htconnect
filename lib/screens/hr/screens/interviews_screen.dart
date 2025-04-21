import 'package:flutter/material.dart';

class InterviewsScreen extends StatelessWidget {
  const InterviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Material(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            child: const TabBar(
              tabs: [
                Tab(text: 'المقابلات القادمة'),
                Tab(text: 'اليوم'),
                Tab(text: 'المكتملة'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildInterviewsList('upcoming'),
                _buildInterviewsList('today'),
                _buildInterviewsList('completed'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInterviewsList(String type) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildDateFilter(),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => _buildInterviewCard(type, index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateFilter() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Icon(Icons.calendar_today),
            const SizedBox(width: 8),
            const Text('تصفية حسب التاريخ'),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: const Text('اختر التاريخ'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInterviewCard(String type, int index) {
    Color statusColor;
    String statusText;
    IconData statusIcon;

    switch (type) {
      case 'upcoming':
        statusColor = Colors.blue;
        statusText = 'قادم';
        statusIcon = Icons.upcoming;
        break;
      case 'today':
        statusColor = Colors.green;
        statusText = 'اليوم';
        statusIcon = Icons.today;
        break;
      default:
        statusColor = Colors.grey;
        statusText = 'مكتمل';
        statusIcon = Icons.check_circle;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: statusColor.withOpacity(0.1),
          child: Icon(statusIcon, color: statusColor),
        ),
        title: Text('مقابلة ${index + 1}'),
        subtitle: Row(
          children: [
            Icon(Icons.access_time, size: 16, color: statusColor),
            const SizedBox(width: 4),
            Text('10:00 صباحاً', style: TextStyle(color: statusColor)),
          ],
        ),
        trailing: Chip(
          label: Text(statusText),
          backgroundColor: statusColor.withOpacity(0.1),
          labelStyle: TextStyle(color: statusColor),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInterviewDetail('المرشح', 'أحمد محمد'),
                _buildInterviewDetail('الوظيفة', 'مطور تطبيقات'),
                _buildInterviewDetail('القسم', 'تطوير البرمجيات'),
                _buildInterviewDetail('المقابل', 'سارة أحمد'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.videocam),
                      label: const Text('بدء المقابلة'),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.edit_calendar),
                      label: const Text('إعادة جدولة'),
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

  Widget _buildInterviewDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}
