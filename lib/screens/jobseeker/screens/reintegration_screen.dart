import 'package:flutter/material.dart';

class ReintegrationScreen extends StatelessWidget {
  const ReintegrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildWelcomeCard(),
                const SizedBox(height: 16),
                _buildTrainingSection(context),
                const SizedBox(height: 16),
                _buildOpportunitiesListView(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildWelcomeCard() {
    return Card(
      color: Colors.purple[50],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'مرحباً بك في برنامج إعادة الإدماج',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'نحن هنا لمساعدتك في بداية جديدة',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatCard('فرص العمل المتاحة', '15+'),
                _buildStatCard('دورات تدريبية', '8'),
                _buildStatCard('نسبة النجاح', '89%'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
        Text(title),
      ],
    );
  }

  Widget _buildTrainingSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.25,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(overscroll: false),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              width: screenWidth * 0.8,
              margin: const EdgeInsets.only(right: 8),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.school,
                              color: Colors.purple[300], size: 24),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'دورة تدريبية ${index + 1}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('المدة: 3 أشهر'),
                          Text(
                              'تاريخ البدء: ${DateTime.now().add(Duration(days: 7 * (index + 1))).toString().substring(0, 10)}'),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text('سجل الآن'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildOpportunitiesListView() {
    final opportunities = [
      {
        'title': 'فرصة عمل في الصيانة',
        'type': 'دوام كامل',
        'support': 'دعم وتوجيه مستمر',
      },
      {
        'title': 'وظيفة في المبيعات',
        'type': 'دوام جزئي',
        'support': 'تدريب مدفوع',
      },
      {
        'title': 'عمل في المستودعات',
        'type': 'دوام كامل',
        'support': 'مواصلات مؤمنة',
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: opportunities.length,
      itemBuilder: (context, index) {
        final opportunity = opportunities[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ExpansionTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purple[100],
              child: const Icon(Icons.work, color: Colors.purple),
            ),
            title: Text(opportunity['title']!),
            subtitle: Text(opportunity['type']!),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'مميزات الوظيفة:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text('• ${opportunity['support']}'),
                    const Text('• متابعة أسبوعية'),
                    const Text('• فرص للتطور الوظيفي'),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
