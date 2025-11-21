import 'package:flutter/material.dart';

class DashboardStatsGrid extends StatelessWidget {
  const DashboardStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: [
        _statCard(
          title: "All Admins",
          value: "234",
          icon: Icons.admin_panel_settings,
        ),
        _statCard(
          title: "Total Vehicles",
          value: "150",
          icon: Icons.directions_car,
        ),
        _statCard(
          title: "Active Vehicle",
          value: "89",
          icon: Icons.show_chart,
        ),
        _statCard(
          title: "Total Users",
          value: "1,230",
          icon: Icons.person_add,
        ),
        _statCard(
          title: "License Issue",
          value: "45",
          icon: Icons.arrow_outward,
        ),
        _statCard(
          title: "License Used",
          value: "180",
          icon: Icons.check_circle,
        ),
      ],
    );
  }

  // SINGLE BOX CARD
  Widget _statCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          )
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row ← text + icon →
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(icon, size: 22, color: Colors.grey[700]),
            ],
          ),

          const SizedBox(height: 14),

          // Number (bold)
          Text(
            value,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
