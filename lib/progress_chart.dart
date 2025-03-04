import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ProgressChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Dark Grey Background
      appBar: AppBar(
        title: Text("Habit Progress"),
        backgroundColor: Colors.white, // Optional: Darken AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(70.0),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: true),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    List<String> dates = ["02-01", "02-02", "02-03", "02-04", "02-05", "02-06", "02-07"];
                    int index = value.toInt();
                    return Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        index < dates.length ? dates[index] : "",
                        style: TextStyle(color: Colors.white, fontSize: 12), // White text for X-axis labels
                      ),
                    );
                  },
                  reservedSize: 30, // Adjust space for bottom labels
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      '${value.toInt()}', // Convert values to integers
                      style: TextStyle(color: Colors.white, fontSize: 12), // White text for Y-axis labels
                    );
                  },
                  reservedSize: 40, // Adjust space for left labels
                ),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false), // Hide top labels
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false), // Hide right labels
              ),
            ),
            borderData: FlBorderData(show: true),
            lineBarsData: [
              LineChartBarData(
              spots: [
                  FlSpot(0, 20),  // Start low
                  FlSpot(1, 35),  // Small increase
                  FlSpot(2, 30),  // Slight dip
                  FlSpot(3, 50),  // Jump up
                  FlSpot(4, 45),  // Small drop
                  FlSpot(5, 60),  // Gradual rise
                  FlSpot(6, 55),  // Slight decrease
                  FlSpot(7, 70),  // Back up
                  FlSpot(8, 65),  // Another small dip
                  FlSpot(9, 80),  // Final push up
                  FlSpot(12, 45),
                ],
                isCurved: true,
                color: Colors.blue,
                barWidth: 3,
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: [Colors.purple.withOpacity(0.5), Colors.blue.withOpacity(0.1)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                dotData: FlDotData(show: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
