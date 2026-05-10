import 'package:flutter/material.dart';

class RecordsScreen extends StatelessWidget {
  const RecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Diagnostics', icon: Icon(Icons.biotech)),
              Tab(text: 'Prescriptions', icon: Icon(Icons.medical_services)),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildDiagnosticsList(),
                _buildPrescriptionsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiagnosticsList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildRecordCard(
          'Blood Chemistry Panel',
          'City General Lab',
          'Oct 22, 2024',
          'Completed',
        ),
        _buildRecordCard(
          'Chest X-Ray',
          'Diagnostic Imaging Center',
          'Oct 15, 2024',
          'View Results',
        ),
        _buildRecordCard(
          'Urinalysis',
          'City General Lab',
          'Sep 30, 2024',
          'Completed',
        ),
      ],
    );
  }

  Widget _buildPrescriptionsList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildRecordCard(
          'Lisinopril 10mg',
          '1 tablet daily',
          'Refills: 2 remaining',
          'Active',
          isPrescription: true,
        ),
        _buildRecordCard(
          'Amoxicillin 500mg',
          'Take 3 times daily for 7 days',
          'Completed: Oct 10, 2024',
          'Inactive',
          isPrescription: true,
        ),
      ],
    );
  }

  Widget _buildRecordCard(
    String title,
    String subtitle,
    String dateInfo,
    String status, {
    bool isPrescription = false,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$subtitle\n$dateInfo'),
        isThreeLine: true,
        trailing: Chip(
          label: Text(
            status,
            style: const TextStyle(fontSize: 10),
          ),
          backgroundColor: status == 'Active' || status == 'View Results'
              ? Colors.green.withOpacity(0.1)
              : null,
        ),
        onTap: () {},
      ),
    );
  }
}
