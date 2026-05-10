import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(
          'Welcome back, Alex',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        _buildQuickStats(context),
        const SizedBox(height: 24),
        _buildNextAppointment(context),
        const SizedBox(height: 24),
        _buildRecentActivity(context),
      ],
    );
  }

  Widget _buildQuickStats(BuildContext context) {
    return Row(
      children: [
        _buildStatCard(context, 'Appointments', '3', Icons.calendar_today, Colors.blue),
        const SizedBox(width: 16),
        _buildStatCard(context, 'Messages', '12', Icons.message, Colors.green),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, String label, String value, IconData icon, Color color) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: color),
              const SizedBox(height: 8),
              Text(value, style: Theme.of(context).textTheme.headlineSmall),
              Text(label, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNextAppointment(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.person)),
        title: const Text('Dr. Sarah Smith'),
        subtitle: const Text('Cardiology - Tomorrow at 10:00 AM'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }

  Widget _buildRecentActivity(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recent Activity', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        const ListTile(
          leading: Icon(Icons.description_outlined),
          title: Text('Lab Results: Blood Work'),
          subtitle: Text('2 days ago'),
        ),
        const ListTile(
          leading: Icon(Icons.medical_services_outlined),
          title: Text('Prescription Refilled: Lisinopril'),
          subtitle: Text('3 days ago'),
        ),
      ],
    );
  }
}
