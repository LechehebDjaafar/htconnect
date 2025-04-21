import 'package:flutter/material.dart';
import 'user_type_screen.dart';

class LoginScreen extends StatefulWidget {
  final String userType;

  const LoginScreen({
    super.key,
    required this.userType,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String userTypeText = '';
    switch (widget.userType) {
      case 'jobseeker':
        userTypeText = 'باحث عن عمل';
        break;
      case 'employer':
        userTypeText = 'صاحب عمل';
        break;
      case 'hr':
        userTypeText = 'مدير موارد بشرية';
        break;
      default:
        userTypeText = '';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل الدخول'),
        centerTitle: true,
      ),
            body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'app_logo',
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 170,
                ),
              ),
              const SizedBox(height: 40),
              if (userTypeText.isNotEmpty) ...[
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text('نوع الحساب: $userTypeText'),
                  ),
                ),
                const SizedBox(height: 20),
              ],
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'البريد الإلكتروني',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'الرجاء إدخال البريد الإلكتروني';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'كلمة المرور',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'الرجاء إدخال كلمة المرور';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text('دخول'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserTypeScreen(),
                  ),
                ),
                child: const Text('إنشاء حساب جديد'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      String route = '';
      switch (widget.userType) {
        case 'jobseeker':
          route = '/jobseeker';
          break;
        case 'employer':
          route = '/company';
          break;
        case 'hr':
          route = '/hr';
          break;
        case 'daily':
          route = '/daily-jobs';
          break;
        default:
          route = '/jobseeker';
      }

      Navigator.pushReplacementNamed(context, route);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
