import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CombinedDashboardRow extends StatelessWidget {
  const CombinedDashboardRow({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isWide = MediaQuery.of(context).size.width >= 800;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: isWide
          ? IntrinsicHeight(           // This forces both cards to have same height
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch, // Important!
                children: const [
                  Expanded(
                    flex: 2,
                    child: AdoptionGrowthCard(),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: VehicleStatusCard(),
                  ),
                ],
              ),
            )
          : Column(
              children: const [
                AdoptionGrowthCard(),
                SizedBox(height: 20),
                VehicleStatusCard(),
              ],
            ),
    );
  }
}

// ======================
// AdoptionGrowthCard (slightly cleaned)
// ======================
class AdoptionGrowthCard extends StatelessWidget {
  const AdoptionGrowthCard({super.key});

  // Unified grey color for all lines
  static final Color _lineColor = Colors.grey[700]!;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
         // Header Row (title + months)
// Header Row (title + filters + legend)
Row(
  crossAxisAlignment: CrossAxisAlignment.start, // This fixes the vertical centering issue
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    // Left: Icon + Title
    Row(
      children: const [
        Icon(Icons.show_chart, size: 22, color: Colors.blueAccent),
        SizedBox(width: 8),
        Text(
          "Adoption & Growth",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    ),

    // Right: Filters + Legend (all top-aligned)
    Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Top row: 12M 6M 3M | Vehicles Users Licenses | Icons
        Row(
          crossAxisAlignment: CrossAxisAlignment.center, // Perfect vertical centering inside this row
          children: [
            // Month filters
            Row(
              children: [
                _monthBox("12M", bgBlack: true),
                const SizedBox(width: 8),
                _monthBox("6M"),
                const SizedBox(width: 8),
                _monthBox("3M"),
              ],
            ),

            const SizedBox(width: 16),

            // First divider
            Container(
              width: 1,
              height: 32,
              color: Colors.grey.shade400,
            ),

            const SizedBox(width: 16),

            // Data type filters
            Row(
              children: [
                _monthBox("Vehicles", bgBlack: true),
                const SizedBox(width: 8),
                _monthBox("Users", bgBlack: true),
                const SizedBox(width: 8),
                _monthBox("Licenses", bgBlack: true),
              ],
            ),

            const SizedBox(width: 16),

            // Second divider
            Container(
              width: 1,
              height: 32,
              color: Colors.grey.shade400,
            ),

            const SizedBox(width: 16),

            // Action icons
            Row(
              children: [
                _circleIcon(Icons.content_copy),
                const SizedBox(width: 12),
                _circleIcon(Icons.filter_list_off),
              ],
            ),
          ],
        ),

        const SizedBox(height: 18),

        // Legend row (right-aligned)
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _legendDot("Vehicles", Colors.black),
            const SizedBox(width: 20),
            _legendDot("Users", Colors.black),
            const SizedBox(width: 20),
            _legendDot("Licenses", Colors.black),
          ],
        ),
      ],
    ),
  ],
),

          const SizedBox(height: 24),

          // Chart - ALL LINES ARE GREY[700]
          SizedBox(
            height: 260,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  horizontalInterval: 10000,
                  getDrawingHorizontalLine: (_) => FlLine(
                    color: Colors.grey.shade200,
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      interval: 10000,
                      getTitlesWidget: (value, meta) => Text(
                        '${(value / 1000).toInt()}k',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        const months = [
                          'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                          'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
                        ];
                        final i = value.toInt();
                        if (i >= 0 && i < 12) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(months[i], style: const TextStyle(fontSize: 12)),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                minY: 0,
                maxY: 60000,

                lineBarsData: [
                  // Vehicles → Grey[700]
                  _lineData(spots: _generateGrowthCurve(endValue: 3577)),
                  // Users → Grey[700]
                  _lineData(spots: _generateGrowthCurve(endValue: 3847)),
                  // Licenses → Grey[700]
                  _lineData(spots: _generateGrowthCurve(endValue: 48234, steeper: false)),
                ],

                lineTouchData: LineTouchData(
                  enabled: true,
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipColor: (spot) => Colors.black87,
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((spot) {
                        final month = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'][spot.x.toInt()];
                        final labels = ["Vehicles", "Users", "Licenses"];
                        final label = labels[spot.barIndex];
                        return LineTooltipItem(
                          '$label\n$month\n${spot.y.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}',
                          TextStyle(color: _legendColors[spot.barIndex], fontWeight: FontWeight.bold),
                        );
                      }).toList();
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper for growth curves
  List<FlSpot> _generateGrowthCurve({required double endValue, bool steeper = false}) {
    final List<FlSpot> spots = [];
    for (int i = 0; i < 12; i++) {
      double progress = i / 11.0;
      double eased = steeper
          ? 1 - (1 - progress) * (1 - progress) * (1 - progress)
          : progress * progress * (3 - 2 * progress);
      spots.add(FlSpot(i.toDouble(), (endValue * eased).roundToDouble()));
    }
    return spots;
  }

  // Single line style — all grey[700]
  LineChartBarData _lineData({required List<FlSpot> spots}) {
    return LineChartBarData(
      spots: spots,
      isCurved: true,
      color: _lineColor, // ← All lines use this grey
      barWidth: 3.5,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        color: _lineColor.withOpacity(0.08),
      ),
    );
  }

  // Legend colors (only for tooltip & legend dots)
  static final List<Color> _legendColors = [Colors.blueAccent, Colors.purple, Colors.green];

  Widget _monthBox(String text, {bool bgBlack = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: bgBlack ? Colors.black : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: bgBlack ? Colors.white : Colors.black87,
        ),
      ),
    );
  }

  Widget _legendDot(String label, Color color) {
    return Row(
      children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
      ],
    );
  }
}

// ======================
// VehicleStatusCard
// ======================
class VehicleStatusCard extends StatelessWidget {
  const VehicleStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          const SizedBox(height: 20),

          _statusRow("Running", "2,986", 26.6, Colors.black),
          const SizedBox(height: 12),
          _statusRow("Stop", "111", 0.99, Colors.black),
          const SizedBox(height: 12),
          _statusRow("Not working (48 hours)", "7,194", 64.08, Colors.black),
          const SizedBox(height: 12),
          _statusRow("No data", "935", 8.33, Colors.black),
        ],
      ),
    );
  }

  Widget _statusRow(String label, String count, double percent, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
            Text("$count (${percent.toStringAsFixed(1)}%)",
                style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: percent / 100,
            backgroundColor: Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation(color),
            minHeight: 10,
          ),
        ),
      ],
    );
  }
}


Widget _circleIcon(IconData icon) {
  return Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      shape: BoxShape.circle,
    ),
    child: Icon(icon, size: 20, color: Colors.black87),
  );
}
