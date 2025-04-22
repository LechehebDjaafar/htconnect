import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InterviewsScreen extends StatefulWidget {
  const InterviewsScreen({super.key});

  @override
  State<InterviewsScreen> createState() => _InterviewsScreenState();
}

class _InterviewsScreenState extends State<InterviewsScreen> {
  final List<Map<String, dynamic>> interviews = [
    {
      'candidate': 'أحمد محمد',
      'position': 'مطور Flutter',
      'department': 'تطوير التطبيقات',
      'interviewer': 'سارة أحمد',
      'date': '2024-02-20',
      'time': '10:00 صباحاً',
      'status': 'upcoming',
      'meetLink': 'https://meet.google.com/abc-defg-hij',
      'cv': 'resume_ahmed.pdf',
      'notes': 'خبرة 3 سنوات في Flutter',
    },
    // ... يمكن إضافة المزيد من المقابلات
  ];

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
    final filteredInterviews =
        interviews.where((interview) => interview['status'] == type).toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildDateFilter(),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: filteredInterviews.length,
              itemBuilder: (context, index) =>
                  _buildInterviewCard(type, filteredInterviews[index]),
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

  Widget _buildInterviewCard(String type, Map<String, dynamic> interview) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 4,
      child: ExpansionTile(
        leading: _buildStatusAvatar(type),
        title: Text(interview['candidate']),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(interview['position']),
            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: _getStatusColor(type)),
                const SizedBox(width: 4),
                Text(
                  '${interview['time']} - ${interview['date']}',
                  style: TextStyle(color: _getStatusColor(type)),
                ),
              ],
            ),
          ],
        ),
        trailing: _buildStatusChip(type),
        children: [
          _buildInterviewDetails(interview, type),
        ],
      ),
    );
  }

  Widget _buildInterviewDetails(Map<String, dynamic> interview, String type) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailSection(
            'معلومات المقابلة',
            [
              _buildDetailRow('المرشح', interview['candidate']),
              _buildDetailRow('الوظيفة', interview['position']),
              _buildDetailRow('القسم', interview['department']),
              _buildDetailRow('المقابل', interview['interviewer']),
            ],
          ),
          if (type == 'upcoming' || type == 'today') ...[
            const Divider(),
            _buildMeetingLink(interview['meetLink']),
          ],
          const Divider(),
          _buildActions(type, interview),
        ],
      ),
    );
  }

  Widget _buildMeetingLink(String link) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'رابط المقابلة',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const Icon(Icons.video_call, color: Colors.blue),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  link,
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.copy, color: Colors.blue),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: link)).then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('تم نسخ رابط الاجتماع'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActions(String type, Map<String, dynamic> interview) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (type == 'upcoming' || type == 'today') ...[
          ElevatedButton.icon(
            onPressed: () => _launchMeeting(interview['meetLink']),
            icon: const Icon(Icons.video_call),
            label: const Text('بدء المقابلة'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
          ),
        ],
        OutlinedButton.icon(
          onPressed: () => _showCandidateCV(interview),
          icon: const Icon(Icons.description),
          label: const Text('السيرة الذاتية'),
        ),
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () => _showMoreOptions(interview),
        ),
      ],
    );
  }

  void _launchMeeting(String link) {
    // تنفيذ فتح رابط المقابلة
  }

  void _showCandidateCV(Map<String, dynamic> interview) {
    // عرض السيرة الذاتية
  }

  void _showMoreOptions(Map<String, dynamic> interview) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.edit_calendar),
            title: const Text('إعادة جدولة'),
            onTap: () {
              Navigator.pop(context);
              // تنفيذ إعادة الجدولة
            },
          ),
          ListTile(
            leading: const Icon(Icons.note_add),
            title: const Text('إضافة ملاحظات'),
            onTap: () {
              Navigator.pop(context);
              // تنفيذ إضافة ملاحظات
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStatusAvatar(String type) {
    Color statusColor = _getStatusColor(type);
    IconData statusIcon = _getStatusIcon(type);

    return CircleAvatar(
      backgroundColor: statusColor.withOpacity(0.1),
      child: Icon(statusIcon, color: statusColor),
    );
  }

  Widget _buildStatusChip(String type) {
    Color statusColor = _getStatusColor(type);
    String statusText = _getStatusText(type);

    return Chip(
      label: Text(statusText),
      backgroundColor: statusColor.withOpacity(0.1),
      labelStyle: TextStyle(color: statusColor),
    );
  }

  Color _getStatusColor(String type) {
    switch (type) {
      case 'upcoming':
        return Colors.blue;
      case 'today':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String type) {
    switch (type) {
      case 'upcoming':
        return Icons.upcoming;
      case 'today':
        return Icons.today;
      default:
        return Icons.check_circle;
    }
  }

  String _getStatusText(String type) {
    switch (type) {
      case 'upcoming':
        return 'قادم';
      case 'today':
        return 'اليوم';
      default:
        return 'مكتمل';
    }
  }

  Widget _buildDetailSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        ...children,
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
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
