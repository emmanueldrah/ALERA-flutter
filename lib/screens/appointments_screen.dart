import 'package:flutter/material.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  int _filterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildFilterChips(),
        Expanded(
          child: ListView(
            children: _buildFilteredList(),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChips() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ChoiceChip(
            label: const Text('All'),
            selected: _filterIndex == 0,
            onSelected: (bool selected) {
              setState(() { _filterIndex = 0; });
            },
          ),
          const SizedBox(width: 8),
          ChoiceChip(
            label: const Text('Upcoming'),
            selected: _filterIndex == 1,
            onSelected: (bool selected) {
              setState(() { _filterIndex = 1; });
            },
          ),
          const SizedBox(width: 8),
          ChoiceChip(
            label: const Text('Past'),
            selected: _filterIndex == 2,
            onSelected: (bool selected) {
              setState(() { _filterIndex = 2; });
            },
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFilteredList() {
    final upcoming = [
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
    ];

    final past = [
      _buildAppointmentItem(
        context,
        'Dr. Michael Chen',
        'General Consultation',
        'Sep 12, 2024 • 02:00 PM',
        false,
        isPast: true,
      ),
    ];

    if (_filterIndex == 1) return upcoming;
    if (_filterIndex == 2) return past;
    return [...upcoming, ...past];
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
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('$subtitle\n$date'),
      isThreeLine: true,
      trailing: isPast ? null : const Icon(Icons.chevron_right),
      onTap: isPast ? null : () {},
    );
  }
}
