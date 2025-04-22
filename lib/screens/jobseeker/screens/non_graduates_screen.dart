import 'package:flutter/material.dart';

class NonGraduatesScreen extends StatelessWidget {
  const NonGraduatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildSkillsSection(constraints),
                  const SizedBox(height: 16),
                  _buildAvailableJobs(context, constraints),
                  const SizedBox(height: 16),
                  _buildJobsList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSkillsSection(BoxConstraints constraints) {
    final skills = [
      {'icon': Icons.construction, 'name': 'حرفي', 'count': '45'},
      {'icon': Icons.drive_eta, 'name': 'سائق', 'count': '32'},
      {'icon': Icons.engineering, 'name': 'عامل بناء', 'count': '28'},
      {'icon': Icons.security, 'name': 'حارس', 'count': '15'},
      {'icon': Icons.cleaning_services, 'name': 'عامل نظافة', 'count': '23'},
      {'icon': Icons.store, 'name': 'بائع', 'count': '19'},
      {'icon': Icons.room_service, 'name': 'خدمة مطاعم', 'count': '25'},
      {'icon': Icons.local_shipping, 'name': 'توصيل', 'count': '30'},
    ];

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'المهارات المطلوبة',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('عرض الكل'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _calculateCrossAxisCount(constraints),
                childAspectRatio: 1,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: skills.length,
              itemBuilder: (context, index) {
                return _buildSkillCard(skills[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  int _calculateCrossAxisCount(BoxConstraints constraints) {
    double width = constraints.maxWidth;
    if (width > 600) {
      return 6;
    } else if (width > 400) {
      return 4;
    } else {
      return 3;
    }
  }

  Widget _buildSkillCard(Map<String, dynamic> skill) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                skill['icon'] as IconData,
                color: Colors.blue,
                size: 24,
              ),
              const SizedBox(height: 4),
              Text(
                skill['name'] as String,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${skill['count']} وظيفة',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvailableJobs(BuildContext context, BoxConstraints constraints) {
    final jobs = [
      {
        'title': 'سائق شاحنة',
        'salary': '45000',
        'location': 'الجزائر العاصمة',
        'company': 'شركة النقل السريع',
        'color': Colors.blue,
      },
      {
        'title': 'عامل بناء ماهر',
        'salary': '40000',
        'location': 'وهران',
        'company': 'مؤسسة البناء الحديث',
        'color': Colors.green,
      },
      {
        'title': 'حارس أمن',
        'salary': '35000',
        'location': 'سطيف',
        'company': 'شركة الحماية',
        'color': Colors.orange,
      },
    ];

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.28,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          overscroll: false,
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: jobs.length,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.75,
              margin: const EdgeInsets.only(right: 8),
              child: _buildJobCard(jobs[index]),
            );
          },
        ),
      ),
    );
  }

  Widget _buildJobCard(Map<String, dynamic> job) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: (job['color'] as Color).withOpacity(0.2),
                  child: Icon(Icons.work, color: job['color'] as Color),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job['title'] as String,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        job['company'] as String,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            _buildInfoRow(Icons.location_on, job['location'] as String),
            const SizedBox(height: 4),
            _buildInfoRow(Icons.attach_money, '${job['salary']} د.ج'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: job['color'] as Color,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('تقدم الآن'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            style: TextStyle(color: Colors.grey[600]),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildJobsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ExpansionTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green[100],
              child: const Icon(Icons.work, color: Colors.green),
            ),
            title: Text('وظيفة ${index + 1}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.access_time, size: 16),
                    SizedBox(width: 4),
                    Text('دوام كامل'),
                    SizedBox(width: 16),
                    Icon(Icons.location_on, size: 16),
                    SizedBox(width: 4),
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
                      'متطلبات العمل:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text('• خبرة سنة في نفس المجال'),
                    const Text('• القدرة على العمل ضمن فريق'),
                    const Text('• الالتزام بمواعيد العمل'),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.send),
                          label: const Text('تقدم للوظيفة'),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.info),
                          label: const Text('المزيد من المعلومات'),
                        ),
                      ],
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
