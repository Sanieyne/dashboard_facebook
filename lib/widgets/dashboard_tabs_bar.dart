import 'package:flutter/material.dart';

class DashboardTabsBar extends StatelessWidget {
  const DashboardTabsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ],
      ),

      child: Row(
        children: [
          _tabItem(Icons.dashboard, "Dashboard", isActive: true),
          const SizedBox(width: 25),

          _tabItem(Icons.admin_panel_settings, "Administrators"),
          const SizedBox(width: 25),

          _tabItem(Icons.local_shipping, "Vehicle"),
          const SizedBox(width: 25),

          _tabItem(Icons.map, "Maps"),
          const SizedBox(width: 25),

          _tabItem(Icons.calendar_month, "Calendar"),
          const SizedBox(width: 25),

          _tabItem(Icons.storage, "Server"),
          const SizedBox(width: 25),

          _othersTab(),
          const SizedBox(width: 25),

          _tabItem(Icons.settings, "Settings"),
        ],
      ),
    );
  }

  // MAIN TAB ITEM (ICON + TEXT)
  Widget _tabItem(IconData icon, String title, {bool isActive = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            SizedBox( width: 20),
            Icon(icon,
                size: 18,
                color: isActive ? Colors.blueAccent : Colors.grey[700]),
            const SizedBox(width: 6),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                color: isActive ? Colors.blueAccent : Colors.grey[700],
              ),
            ),
          ],
        ),

        if (isActive)
          Container(
            margin: const EdgeInsets.only(top: 4),
            height: 3,
            width: 22,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
      ],
    );
  }

  // OTHERS TAB (... + dropdown icon)
  Widget _othersTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            const Icon(Icons.more_horiz, size: 20, color: Colors.grey),
            const SizedBox(width: 6),
            Text(
              "Others",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down,
                size: 18, color: Colors.grey),
          ],
        )
      ],
    );
  }
}
