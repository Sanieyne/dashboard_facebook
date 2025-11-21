import 'package:dashboard_facebook/widgets/adoptation_growth.dart';
import 'package:dashboard_facebook/widgets/dashboard_stat_grid.dart';
import 'package:dashboard_facebook/widgets/dashboard_recent_cards.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/dashboard_tabs_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f6fa),
      appBar: const CustomAppBar(),

      body: Column(
        children: [
          const SizedBox(height: 2),
          const DashboardTabsBar(),
          const SizedBox(height: 10),

          // SCROLLABLE CONTENT
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: const [
                  DashboardStatsGrid(),
                  SizedBox(height: 20),
                  CombinedDashboardRow(),
                  SizedBox(height: 20),
                  DashboardRecentCards(),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
