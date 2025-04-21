import 'package:flutter/material.dart';

class CompanyRegistrationForm extends StatefulWidget {
  const CompanyRegistrationForm({super.key});

  @override
  State<CompanyRegistrationForm> createState() =>
      _CompanyRegistrationFormState();
}

class _CompanyRegistrationFormState extends State<CompanyRegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _activityController = TextEditingController();
  final _commercialRecordController = TextEditingController();
  final _taxNumberController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل مؤسسة'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'اسم المؤسسة',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'الرجاء إدخال اسم المؤسسة';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _activityController,
              decoration: const InputDecoration(
                labelText: 'النشاط الاقتصادي',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('تسجيل'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // سيتم إضافة منطق حفظ البيانات لاحقاً
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _activityController.dispose();
    _commercialRecordController.dispose();
    _taxNumberController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
