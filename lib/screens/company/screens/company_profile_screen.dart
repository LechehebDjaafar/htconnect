import 'package:flutter/material.dart';

class CompanyProfileScreen extends StatelessWidget {
  const CompanyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCompanyHeader(),
          const SizedBox(height: 24),
          _buildCompanyInfo(),
          const SizedBox(height: 24),
          _buildContactInfo(),
          const SizedBox(height: 24),
          _buildDocuments(),
        ],
      ),
    );
  }

  Widget _buildCompanyHeader() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue[50],
              child: const Icon(Icons.business, size: 50, color: Colors.blue),
            ),
            const SizedBox(height: 16),
            const Text(
              'شركة التقنية المتقدمة',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text('تكنولوجيا المعلومات'),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: [
                Chip(
                  avatar: const Icon(Icons.verified, size: 18),
                  label: const Text('موثق'),
                ),
                Chip(
                  avatar: const Icon(Icons.group, size: 18),
                  label: const Text('100+ موظف'),
                ),
                Chip(
                  avatar: const Icon(Icons.location_on, size: 18),
                  label: const Text('الجزائر'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyInfo() {
    return Card(
      child: Column(
        children: [
          const ListTile(
            title: Text('معلومات الشركة'),
            leading: Icon(Icons.info),
          ),
          const Divider(),
          _buildInfoItem('السجل التجاري', '123456789'),
          _buildInfoItem('الرقم الضريبي', '987654321'),
          _buildInfoItem('تاريخ التأسيس', '2010'),
          _buildInfoItem('النشاط الرئيسي', 'تطوير البرمجيات'),
        ],
      ),
    );
  }

  Widget _buildContactInfo() {
    return Card(
      child: Column(
        children: [
          const ListTile(
            title: Text('معلومات الاتصال'),
            leading: Icon(Icons.contact_phone),
          ),
          const Divider(),
          _buildInfoItem('البريد الإلكتروني', 'info@company.com'),
          _buildInfoItem('الهاتف', '+213 123456789'),
          _buildInfoItem('العنوان', 'الجزائر العاصمة'),
          _buildInfoItem('الموقع الإلكتروني', 'www.company.com'),
        ],
      ),
    );
  }

  Widget _buildDocuments() {
    return Card(
      child: Column(
        children: [
          const ListTile(
            title: Text('الوثائق والمستندات'),
            leading: Icon(Icons.folder),
          ),
          const Divider(),
          ListTile(
            title: const Text('السجل التجاري'),
            leading: const Icon(Icons.file_present),
            trailing: IconButton(
              icon: const Icon(Icons.download),
              onPressed: () {},
            ),
          ),
          ListTile(
            title: const Text('الملف الضريبي'),
            leading: const Icon(Icons.file_present),
            trailing: IconButton(
              icon: const Icon(Icons.download),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
