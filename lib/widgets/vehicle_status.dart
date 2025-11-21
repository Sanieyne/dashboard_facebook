import 'package:flutter/material.dart';

class VehicleStatusCard extends StatelessWidget {
  const VehicleStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.only(bottom: 20),
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
          // Top row icon + text
          Row(
            children: const [
              Icon(Icons.directions_car, size: 22, color: Colors.blueAccent),
              SizedBox(width: 8),
              Text(
                "Vehicle Status",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),

          _statusIndicator("Running", "2,986", 26.6, Colors.green),
          const SizedBox(height: 10),
          _statusIndicator("Stop", "111", 0.99, Colors.red),
          const SizedBox(height: 10),
          _statusIndicator("Not working (48 hours)", "7,194", 64.08, Colors.orange),
          const SizedBox(height: 10),
          _statusIndicator("No data", "935", 8.33, Colors.grey),
        ],
      ),
    );
  }

  Widget _statusIndicator(String label, String value, double percent, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Row: label + value
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Text("$value (${percent.toStringAsFixed(2)}%)"),
          ],
        ),
        const SizedBox(height: 6),
        // Indicator bar
        Container(
          height: 10,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(6),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: percent / 100,
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
