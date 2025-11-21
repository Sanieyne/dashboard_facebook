import 'package:flutter/material.dart';

class DashboardRecentCards extends StatelessWidget {
  const DashboardRecentCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(child: RecentVehiclesCard()),
              SizedBox(width: 15),
              Expanded(child: RecentTransactionsCard()),
              SizedBox(width: 15),
              Expanded(child: RecentUsersCard()),
            ],
          ),

          const SizedBox(height: 15),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(child: RecentNotificationsCard()),
              SizedBox(width: 15),
              Expanded(child: RecentActivityCard()),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------- STATUS BADGE WIDGET ----------
Widget _statusBadge(String text, {Color bgColor = Colors.black, Color textColor = Colors.white}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      text,
      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: textColor),
    ),
  );
}

// ---------- RECENT VEHICLES ----------
class RecentVehiclesCard extends StatelessWidget {
  const RecentVehiclesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return _dashboardCard(
      icon: Icons.directions_car,
      title: "Recent Vehicles",
      topSpacing: 20,
      child: SizedBox(
        height: 220,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, i) {
            bool isActive = i % 2 == 0;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  _circleIcon(Icons.directions_car),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("MH-12-AB-${1200 + i}",
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 3),
                        Text("Tata Ace",
                            style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _statusBadge(isActive ? "Active" : "Inactive",
                          bgColor: isActive ? Colors.black : Colors.grey),
                      const SizedBox(height: 3),
                      Text("Today 10:15",
                          style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// ---------- RECENT TRANSACTIONS ----------
class RecentTransactionsCard extends StatelessWidget {
  const RecentTransactionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return _dashboardCard(
      icon: Icons.receipt_long,
      title: "Recent Transactions",
      topSpacing: 20,
      child: SizedBox(
        height: 220,
        child: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, i) {
            bool isCompleted = i % 2 == 0;
            Color badgeColor = isCompleted ? Colors.black : (i % 3 == 0 ? Colors.grey : Colors.grey);
            String statusText = isCompleted ? "Completed" : (i % 3 == 0 ? "Pending" : "Failed");

            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Row(
                children: [
              //    _circleIcon(Icons.payments),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("TXN-2024-10-${1120 + i}",
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 3),
                        Text(
                          i % 2 == 0 ? "License Purchase" : "Subscription Renewal",
                          style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("₹${2000 + i * 150}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13)),
                      const SizedBox(height: 4),
                      _statusBadge(statusText, bgColor: badgeColor),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// ---------- RECENT USERS ----------
class RecentUsersCard extends StatelessWidget {
  const RecentUsersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return _dashboardCard(
      icon: Icons.person_add,
      title: "Recent Users",
      topSpacing: 20,
      child: SizedBox(
        height: 220,
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, i) {
            String name = "Muhammad Sani";
            String initials = "MS";

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  _circleText(initials),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14)),
                        const SizedBox(height: 2),
                        Text("msani${i}@gmail.com",
                            style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text("Today 11:20",
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// ---------- RECENT NOTIFICATIONS ----------
class RecentNotificationsCard extends StatelessWidget {
  const RecentNotificationsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return _dashboardCard(
      icon: Icons.notifications,
      title: "Recent Notifications",
      topSpacing: 20,
      child: SizedBox(
        height: 220,
        child: ListView(
          children: const [
            _notifItem("Devices Offline > 24h"),
            _notifItem("3 Vehicles entered restricted zone"),
            _notifItem("New admin added by Super Admin"),
            _notifItem("2 Licenses expiring soon"),
          ],
        ),
      ),
    );
  }
}

class _notifItem extends StatelessWidget {
  final String text;
  const _notifItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
    //      _circleIcon(Icons.notifications_active),
          const SizedBox(width: 12),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}

// ---------- RECENT ACTIVITY ----------
class RecentActivityCard extends StatelessWidget {
  const RecentActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return _dashboardCard(
      icon: Icons.show_chart,
      title: "Recent User Activity",
      topSpacing: 20,
      child: SizedBox(
        height: 220,
        child: ListView(
          children: const [
            _activityItem("Maya R.", "Added 12 vehicles via CSV", "10:33"),
            _activityItem("Adams K.", "Updated fleet information", "09:10"),
            _activityItem("Leena S.", "Removed an inactive device", "08:55"),
          ],
        ),
      ),
    );
  }
}

class _activityItem extends StatelessWidget {
  final String name;
  final String info;
  final String time;

  const _activityItem(this.name, this.info, this.time);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
       //   _circleIcon(Icons.person),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 3),
                Text(info, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
              ],
            ),
          ),
          Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}

// ---------- DASHBOARD CARD ----------
Widget _dashboardCard({
  required IconData icon,
  required String title,
  required Widget child,
  double topSpacing = 12,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: const [
        BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2))
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 20, color: Colors.blueAccent),
            const SizedBox(width: 8),
            Text(title,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: topSpacing),
        child,
      ],
    ),
  );
}

// ---------- ICON & TEXT CIRCLES ----------
Widget _circleIcon(IconData icon) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Color(0xffeef2f7),
    ),
    child: Icon(icon, size: 18, color: Colors.black87),
  );
}

Widget _circleText(String text) {
  return Container(
    width: 40,
    height: 40,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.blueAccent.withOpacity(0.15),
    ),
    child: Text(text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
  );
}
