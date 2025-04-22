import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

class GraduatesScreen extends StatefulWidget {
  const GraduatesScreen({super.key});

  @override
  State<GraduatesScreen> createState() => _GraduatesScreenState();
}

class _GraduatesScreenState extends State<GraduatesScreen> {
  File? selectedCV;

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
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'ابحث عن وظيفة...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: [
                ChoiceChip(
                  label: const Text('دوام كامل'),
                  selected: false,
                  onSelected: (bool selected) {},
                ),
                ChoiceChip(
                  label: const Text('عن بعد'),
                  selected: false,
                  onSelected: (bool selected) {},
                ),
                ChoiceChip(
                  label: const Text('متدرب'),
                  selected: false,
                  onSelected: (bool selected) {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilters() {
    final categories = [
      {'icon': Icons.code, 'name': 'برمجة'},
      {'icon': Icons.business, 'name': 'إدارة'},
      {'icon': Icons.healing, 'name': 'طب'},
      {'icon': Icons.school, 'name': 'تعليم'},
      {'icon': Icons.architecture, 'name': 'هندسة'},
      {'icon': Icons.account_balance, 'name': 'محاسبة'},
    ];

    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 80,
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(categories[index]['icon'] as IconData),
                    const SizedBox(height: 4),
                    Text(
                      categories[index]['name'] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12),
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
    final jobs = [
      {
        'title': 'مهندس برمجيات',
        'company': 'شركة التقنية المتقدمة',
        'location': 'الجزائر العاصمة',
        'type': 'دوام كامل',
        'salary': '80,000 - 120,000 د.ج',
        'requirements': ['خبرة 3 سنوات', 'Flutter', 'Python'],
        'icon': Icons.code,
        'color': Colors.blue,
      },
      {
        'title': 'طبيب مقيم',
        'company': 'مستشفى الشفاء',
        'location': 'وهران',
        'type': 'دوام كامل',
        'salary': '120,000 - 150,000 د.ج',
        'requirements': ['شهادة طب', 'خبرة سنتين'],
        'icon': Icons.local_hospital,
        'color': Colors.green,
      },
      {
        'title': 'مدرس لغة إنجليزية',
        'company': 'مدرسة المستقبل',
        'location': 'قسنطينة',
        'type': 'دوام جزئي',
        'salary': '40,000 - 60,000 د.ج',
        'requirements': ['شهادة في التعليم', 'TOEFL'],
        'icon': Icons.school,
        'color': Colors.orange,
      },
    ];

    return ListView.builder(
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        final job = jobs[index];
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: InkWell(
            onTap: () => _showJobDetails(context, job),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: (job['color'] as Color).withOpacity(0.2),
                      child: Icon(job['icon'] as IconData,
                          color: job['color'] as Color),
                    ),
                    title: Text(
                      job['title'] as String,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(job['company'] as String),
                    trailing: IconButton(
                      icon: const Icon(Icons.bookmark_border),
                      onPressed: () {},
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildJobDetail(
                          Icons.location_on, job['location'] as String),
                      _buildJobDetail(Icons.access_time, job['type'] as String),
                      _buildJobDetail(
                          Icons.attach_money, job['salary'] as String),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildJobDetail(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  void _showJobDetails(BuildContext context, Map<String, dynamic> job) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) => SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildJobHeader(job),
                  const SizedBox(height: 20),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'السيرة الذاتية',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          if (selectedCV != null)
                            ListTile(
                              leading: const Icon(Icons.description),
                              title: Text(selectedCV!.path.split('/').last),
                              trailing: IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  setState(() {
                                    selectedCV = null;
                                  });
                                },
                              ),
                            )
                          else
                            Center(
                              child: ElevatedButton.icon(
                                onPressed: () async {
                                  final result =
                                      await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['pdf', 'doc', 'docx'],
                                  );
                                  if (result != null) {
                                    setState(() {
                                      selectedCV =
                                          File(result.files.single.path!);
                                    });
                                  }
                                },
                                icon: const Icon(Icons.upload_file),
                                label: const Text('رفع السيرة الذاتية'),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildJobDetails(job),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: selectedCV == null
                          ? null
                          : () => _showApplicationConfirmation(
                              context, job, selectedCV!),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                      ),
                      child: const Text('تقدم للوظيفة'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildJobHeader(Map<String, dynamic> job) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: (job['color'] as Color).withOpacity(0.2),
          radius: 30,
          child: Icon(job['icon'] as IconData,
              color: job['color'] as Color, size: 30),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                job['title'] as String,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(job['company'] as String),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildJobDetails(Map<String, dynamic> job) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailSection('التفاصيل', [
          _buildDetailRow('المكان', job['location'] as String),
          _buildDetailRow('نوع العمل', job['type'] as String),
          _buildDetailRow('الراتب', job['salary'] as String),
        ]),
        const SizedBox(height: 16),
        _buildDetailSection(
          'المتطلبات',
          (job['requirements'] as List)
              .map((req) => _buildDetailRow('•', req as String))
              .toList(),
        ),
      ],
    );
  }

  void _showApplicationConfirmation(
      BuildContext context, Map<String, dynamic> job, File cv) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تأكيد التقديم'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('الوظيفة: ${job['title']}'),
            Text('الشركة: ${job['company']}'),
            const SizedBox(height: 8),
            const Text('تم إرفاق:'),
            ListTile(
              leading: const Icon(Icons.description),
              title: Text(cv.path.split('/').last),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('تم إرسال طلبك بنجاح'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text('تأكيد التقديم'),
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
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        ...children,
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(width: 8),
          Text(value),
        ],
      ),
    );
  }
}
