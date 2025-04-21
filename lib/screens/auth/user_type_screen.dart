import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'login_screen.dart';

class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اختر نوع الحساب'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Hero(
              tag: 'app_logo',
              child: Image.asset(
                'assets/images/logo.png',
                height: 300,
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTypeCard(
                    context,
                    'باحث عن عمل',
                    Icons.person_search,
                    Colors.blue,
                    () => _navigateToAuth(context, 'jobseeker'),
                  ),
                  const SizedBox(height: 16),
                  _buildTypeCard(
                    context,
                    'صاحب عمل',
                    Icons.business,
                    Colors.green,
                    () => _navigateToAuth(context, 'employer'),
                  ),
                  const SizedBox(height: 16),
                  _buildTypeCard(
                    context,
                    'مدير موارد بشرية',
                    Icons.people,
                    Colors.orange,
                    () => _navigateToAuth(context, 'hr'),
                  ),
                  const SizedBox(height: 16),
                  _buildTypeCard(
                    context,
                    'الأعمال اليومية',
                    Icons.work_history,
                    Colors.purple,
                    () => _navigateToAuth(context, 'daily'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeCard(BuildContext context, String title, IconData icon,
      Color color, VoidCallback onTap) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(fontSize: 18),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToAuth(BuildContext context, String userType) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('اختيار العملية'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('تسجيل الدخول'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(userType: userType),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_add),
              title: const Text('إنشاء حساب جديد'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(userType: userType),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
