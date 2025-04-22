import 'package:flutter/material.dart';

class JobsManagementScreen extends StatefulWidget {
  const JobsManagementScreen({super.key});

  @override
  State<JobsManagementScreen> createState() => _JobsManagementScreenState();
}

class _JobsManagementScreenState extends State<JobsManagementScreen> {
  String _selectedFilter = 'الكل';
  final List<String> _filters = ['الكل', 'نشط', 'معلق', 'مغلق'];

  final jobs = [
    {
      'title': 'مطور تطبيقات Flutter',
      'department': 'تطوير البرمجيات',
      'location': 'الجزائر العاصمة',
      'type': 'دوام كامل',
      'salary': '90,000 - 120,000 د.ج',
      'requirements': [
        'خبرة 3 سنوات في Flutter',
        'معرفة بـ Firebase',
        'مهارات تواصل جيدة'
      ],
      'applicants': 23,
      'status': 'نشط',
      'icon': Icons.code,
      'color': Colors.blue,
    },
    {
      'title': 'محاسب رئيسي',
      'department': 'المالية',
      'location': 'وهران',
      'type': 'دوام كامل',
      'salary': '70,000 - 90,000 د.ج',
      'requirements': [
        'خبرة 5 سنوات في المحاسبة',
        'شهادة محاسبة معتمدة',
        'إجادة Excel'
      ],
      'applicants': 15,
      'status': 'نشط',
      'icon': Icons.account_balance,
      'color': Colors.green,
    },
    {
      'title': 'مدير تسويق',
      'department': 'التسويق',
      'location': 'قسنطينة',
      'type': 'دوام كامل',
      'salary': '100,000 - 150,000 د.ج',
      'requirements': [
        'خبرة 7 سنوات في التسويق الرقمي',
        'مهارات قيادية',
        'إجادة الإنجليزية'
      ],
      'applicants': 18,
      'status': 'معلق',
      'icon': Icons.trending_up,
      'color': Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildAdvancedStats(),
          const SizedBox(height: 16),
          _buildFilters(),
          const SizedBox(height: 16),
          _buildJobsList(),
        ],
      ),
    );
  }

  Widget _buildAdvancedStats() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.22,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(overscroll: false),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildStatCard(
              'الوظائف النشطة',
              '12',
              Colors.green,
              Icons.work,
              '↑ 15% هذا الشهر',
              screenWidth,
            ),
            _buildStatCard(
              'المتقدمين الجدد',
              '45',
              Colors.blue,
              Icons.people,
              '32 مقابلة هذا الأسبوع',
              screenWidth,
            ),
            _buildStatCard(
              'معدل التوظيف',
              '78%',
              Colors.orange,
              Icons.trending_up,
              'متوسط وقت التوظيف: 15 يوم',
              screenWidth,
            ),
            _buildStatCard(
              'التكلفة',
              '25k',
              Colors.purple,
              Icons.attach_money,
              'الميزانية المتبقية: 100k',
              screenWidth,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color, IconData icon,
      String subtitle, double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.75,
      child: Card(
        margin: const EdgeInsets.only(right: 8),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: color.withOpacity(0.2),
                    child: Icon(icon, color: color),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilters() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'بحث عن وظيفة...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                PopupMenuButton(
                  icon: const Icon(Icons.more_vert),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'export',
                      child: Text('تصدير كـ Excel'),
                    ),
                    const PopupMenuItem(
                      value: 'stats',
                      child: Text('إحصائيات مفصلة'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _filters
                    .map((filter) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(filter),
                            selected: _selectedFilter == filter,
                            onSelected: (selected) {
                              setState(() {
                                _selectedFilter = filter;
                              });
                            },
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobsList() {
    return Expanded(
      child: ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, index) => _buildJobCard(jobs[index]),
      ),
    );
  }

  Widget _buildJobCard(Map<String, dynamic> job) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 4,
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: (job['color'] as Color).withOpacity(0.2),
          child: Icon(job['icon'] as IconData, color: job['color'] as Color),
        ),
        title: Text(job['title'] as String),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(job['department'] as String),
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                Text(job['location'] as String),
                const SizedBox(width: 16),
                Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                Text(job['type'] as String),
              ],
            ),
          ],
        ),
        trailing: Chip(
          label: Text(
            job['status'] as String,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: job['status'] == 'نشط'
              ? Colors.green
              : job['status'] == 'معلق'
                  ? Colors.orange
                  : Colors.red,
        ),
        children: [
          _buildJobDetails(job),
        ],
      ),
    );
  }

  Widget _buildJobDetails(Map<String, dynamic> job) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'المتطلبات:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...(job['requirements'] as List).map((req) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle,
                        size: 16, color: Colors.green),
                    const SizedBox(width: 8),
                    Text(req),
                  ],
                ),
              )),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('الراتب: ${job['salary']}'),
                  Text('عدد المتقدمين: ${job['applicants']}'),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {},
                    tooltip: 'تعديل',
                  ),
                  IconButton(
                    icon: const Icon(Icons.people),
                    onPressed: () {},
                    tooltip: 'المتقدمين',
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {},
                    color: Colors.red,
                    tooltip: 'إغلاق',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
