import 'package:flutter/material.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildSectionHeader(context, 'Upcoming'),
        _buildAppointmentItem(
          context,
          'Dr. Sarah Smith',
          'Cardiology Checkup',
          'Oct 24, 2024 • 10:00 AM',
          true,
        ),
        _buildAppointmentItem(
          context,
          'City Lab Services',
          'Routine Blood Work',
          'Oct 26, 2024 • 08:30 AM',
          false,
        ),
        _buildSectionHeader(context, 'Past'),
        _buildAppointmentItem(
          context,
          'Dr. Michael Chen',
          'General Consultation',
          'Sep 12, 2024 • 02:00 PM',
          false,
          isPast: true,
        ),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildAppointmentItem(
    BuildContext context,
    String title,
    String subtitle,
    String date,
    bool isUrgent, {
    bool isPast = false,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isUrgent ? Colors.red.withOpacity(0.1) : Colors.blue.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          isUrgent ? Icons.priority_high : Icons.event,
          color: isUrgent ? Colors.red : Colors.blue,
        ),
      ),
      title: Text(title),
      subtitle: Text('$subtitle\n$date'),
      isThreeLine: true,
      trailing: isPast ? null : const Icon(Icons.chevron_right),
      onTap: isPast ? null : () {},
    );
  }
}
