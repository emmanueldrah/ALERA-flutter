import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Health Profile')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.person, size: 50),
                ),
                SizedBox(height: 16),
                Text('Alex Johnson', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text('Patient ID: AL-99234', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          const SizedBox(height: 32),
          _buildSection(context, 'Medical ID (Emergency)', [
            _buildInfoTile('Blood Type', 'A+'),
            _buildInfoTile('Allergies', 'Penicillin, Peanuts'),
            _buildInfoTile('Emergency Contact', 'Jane Johnson (555-0102)'),
          ], isEmergency: true),
          const SizedBox(height: 24),
          _buildSection(context, 'Insurance', [
            _buildInfoTile('Provider', 'HealthGuard Blue'),
            _buildInfoTile('Policy Number', 'HG-882-1102'),
          ]),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.red,
              minimumSize: const Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<Widget> children, {bool isEmergency = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isEmergency ? Colors.red : Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        Card(
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildInfoTile(String label, String value) {
    return ListTile(
      title: Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      subtitle: Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      dense: true,
    );
  }
}
