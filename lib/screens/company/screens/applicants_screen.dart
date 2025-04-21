import 'package:flutter/material.dart';

class ApplicantsScreen extends StatelessWidget {
  const ApplicantsScreen({super.key});

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
                Tab(text: 'طلبات جديدة'),
                Tab(text: 'قيد المراجعة'),
                Tab(text: 'تمت المعالجة'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildApplicantsList('new'),
                _buildApplicantsList('reviewing'),
                _buildApplicantsList('processed'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApplicantsList(String status) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildFilters(),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) =>
                  _buildApplicantCard(status, index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'بحث...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApplicantCard(String status, int index) {
    Color statusColor;
    String statusText;

    switch (status) {
      case 'new':
        statusColor = Colors.blue;
        statusText = 'جديد';
        break;
      case 'reviewing':
        statusColor = Colors.orange;
        statusText = 'قيد المراجعة';
        break;
      default:
        statusColor = Colors.green;
        statusText = 'تمت المعالجة';
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ExpansionTile(
        leading: CircleAvatar(
          child: Text('${index + 1}'),
        ),
        title: Text('متقدم ${index + 1}'),
        subtitle: Row(
          children: [
            Icon(Icons.work, size: 16, color: statusColor),
            Text(' مطور تطبيقات'),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                statusText,
                style: TextStyle(color: statusColor),
              ),
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildApplicantDetail('البريد الإلكتروني', 'email@example.com'),
                _buildApplicantDetail('رقم الهاتف', '+213 123456789'),
                _buildApplicantDetail('الخبرة', '5 سنوات'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.download),
                      label: const Text('السيرة الذاتية'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.calendar_today),
                      label: const Text('جدولة مقابلة'),
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

  Widget _buildApplicantDetail(String label, String value) {
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
