import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildHeader(context),
        const SizedBox(height: 24),
        _buildVitalSigns(context),
        const SizedBox(height: 24),
        _buildEmergencyAction(context),
        const SizedBox(height: 24),
        _buildNextAppointment(context),
        const SizedBox(height: 24),
        _buildRecentActivity(context),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back, Alex',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Your health summary for today',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildVitalSigns(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Vital Signs', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        Row(
          children: [
            _buildVitalCard(context, 'Heart Rate', '72 bpm', Icons.favorite, Colors.red),
            const SizedBox(width: 12),
            _buildVitalCard(context, 'Blood Pressure', '120/80', Icons.speed, Colors.orange),
          ],
        ),
      ],
    );
  }

  Widget _buildVitalCard(BuildContext context, String label, String value, IconData icon, Color color) {
    return Expanded(
      child: Card(
        elevation: 0,
        color: color.withOpacity(0.05),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: color.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(height: 12),
              Text(value, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              Text(label, style: Theme.of(context).textTheme.labelSmall),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmergencyAction(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.shade100),
      ),
      child: Row(
        children: [
          const Icon(Icons.emergency_share, color: Colors.red),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Emergency Action', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                Text('Share your medical profile with responders', style: TextStyle(fontSize: 12, color: Colors.red.shade700)),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('SHARE'),
          ),
        ],
      ),
    );
  }

  Widget _buildNextAppointment(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Next Appointment', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: const Text('Dr. Sarah Smith', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Cardiology - Oct 24, 10:00 AM'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildRecentActivity(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Recent Activity', style: Theme.of(context).textTheme.titleLarge),
            TextButton(onPressed: () {}, child: const Text('See All')),
          ],
        ),
        const ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(Icons.description_outlined),
          title: Text('Lab Results: Blood Work'),
          subtitle: Text('2 days ago'),
        ),
        const ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(Icons.medical_services_outlined),
          title: Text('Prescription Refilled: Lisinopril'),
          subtitle: Text('3 days ago'),
        ),
      ],
    );
  }
}
