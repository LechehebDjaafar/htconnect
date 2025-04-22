import 'package:flutter/material.dart';

class ApplicantsScreen extends StatefulWidget {
  const ApplicantsScreen({super.key});

  @override
  State<ApplicantsScreen> createState() => _ApplicantsScreenState();
}

class _ApplicantsScreenState extends State<ApplicantsScreen> {
  final List<Map<String, dynamic>> applicants = [
    {
      'name': 'أحمد محمد',
      'job': 'مطور تطبيقات Flutter',
      'email': 'ahmed@example.com',
      'phone': '+213 555-123456',
      'experience': '3 سنوات',
      'skills': ['Flutter', 'Dart', 'Firebase'],
      'education': 'بكالوريوس هندسة برمجيات',
      'status': 'new',
      'avatar': 'أ',
      'rating': 4.5,
    },
    {
      'name': 'سارة علي',
      'job': 'مصممة واجهات مستخدم',
      'email': 'sara@example.com',
      'phone': '+213 555-789012',
      'experience': '4 سنوات',
      'skills': ['UI/UX', 'Figma', 'Adobe XD'],
      'education': 'ماجستير تصميم',
      'status': 'reviewing',
      'avatar': 'س',
      'rating': 4.8,
    },
    // ...يمكن إضافة المزيد من المتقدمين
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              _buildStatistics(constraints),
              Material(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                child: const TabBar(
                  tabs: [
                    Tab(text: 'طلبات جديدة (15)'),
                    Tab(text: 'قيد المراجعة (8)'),
                    Tab(text: 'تمت المعالجة (23)'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildApplicantsList('new', constraints),
                    _buildApplicantsList('reviewing', constraints),
                    _buildApplicantsList('processed', constraints),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildStatistics(BoxConstraints constraints) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.15,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(overscroll: false),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildStatCard('إجمالي المتقدمين', '46', Icons.people, Colors.blue,
                constraints),
            _buildStatCard('المقابلات اليوم', '5', Icons.calendar_today,
                Colors.green, constraints),
            _buildStatCard(
                'متوسط التقييم', '4.2', Icons.star, Colors.orange, constraints),
            _buildStatCard('تم التوظيف', '12', Icons.check_circle,
                Colors.purple, constraints),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color,
      BoxConstraints constraints) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * 0.4,
      child: Card(
        margin: const EdgeInsets.only(right: 8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: color),
                  const SizedBox(width: 8),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildApplicantsList(String status, BoxConstraints constraints) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildFilters(constraints),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: applicants.length,
              itemBuilder: (context, index) =>
                  _buildApplicantCard(status, applicants[index]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilters(BoxConstraints constraints) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'بحث في المتقدمين...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                PopupMenuButton(
                  icon: const Icon(Icons.tune),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      child: Text('التقييم الأعلى'),
                    ),
                    const PopupMenuItem(
                      child: Text('الخبرة الأكثر'),
                    ),
                    const PopupMenuItem(
                      child: Text('الأحدث'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 40,
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(overscroll: false),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildFilterChip('Flutter'),
                    _buildFilterChip('React'),
                    _buildFilterChip('UI/UX'),
                    _buildFilterChip('Python'),
                    _buildFilterChip('Java'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        onSelected: (bool selected) {},
      ),
    );
  }

  Widget _buildApplicantCard(String status, Map<String, dynamic> applicant) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor:
              _getStatusColor(applicant['status']).withOpacity(0.2),
          child: Text(applicant['avatar']),
        ),
        title: Text(applicant['name']),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(applicant['job']),
            Row(
              children: [
                Icon(Icons.star, size: 16, color: Colors.amber),
                Text(' ${applicant['rating']}'),
                const SizedBox(width: 16),
                Icon(Icons.work, size: 16, color: Colors.grey),
                Text(' ${applicant['experience']}'),
              ],
            ),
          ],
        ),
        children: [
          _buildApplicantDetails(applicant),
        ],
      ),
    );
  }

  Widget _buildApplicantDetails(Map<String, dynamic> applicant) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailSection('المعلومات الشخصية', [
            _buildDetailItem(Icons.email, applicant['email']),
            _buildDetailItem(Icons.phone, applicant['phone']),
            _buildDetailItem(Icons.school, applicant['education']),
          ]),
          const Divider(),
          _buildDetailSection('المهارات', [
            Wrap(
              spacing: 8,
              children: (applicant['skills'] as List)
                  .map((skill) => Chip(label: Text(skill)))
                  .toList(),
            ),
          ]),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.description),
                label: const Text('السيرة الذاتية'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.calendar_today),
                label: const Text('جدولة مقابلة'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.close),
                label: const Text('رفض'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ...children,
      ],
    );
  }

  Widget _buildDetailItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'new':
        return Colors.blue;
      case 'reviewing':
        return Colors.orange;
      case 'processed':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
