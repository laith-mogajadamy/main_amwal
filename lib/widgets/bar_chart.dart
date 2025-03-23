import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/model/barChartData/bar_chart_data_model.dart';
import 'package:mainamwal/widgets/font/app_text.dart';

class BarChartWidget extends StatelessWidget {
  final List<BarChartDataModel> data;

  const BarChartWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: data.map((e) => e.value).reduce((a, b) => a > b ? a : b) +
              10, // Adjust max Y dynamically
          minY: 0,
          barTouchData: BarTouchData(enabled: true),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              axisNameWidget: AppText(
                text: "USD",
                color: AppColor.apptitle,
                fontSize: 10,
              ),
              sideTitles: SideTitles(
                showTitles: true,
                interval: 20, // Control step size
                reservedSize: 40, // Space for labels
                getTitlesWidget: (value, meta) {
                  return AppText(
                    text: '${value.toInt()}',
                    color: AppColor.apptitle,
                    fontSize: 10,
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              axisNameWidget: AppText(
                text: "Month",
                color: AppColor.apptitle,
                fontSize: 10,
              ),
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  if (value.toInt() < data.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: AppText(
                        text: data[value.toInt()].label,
                        color: AppColor.apptitle,
                        fontSize: 10,
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
          gridData: FlGridData(show: false), // Show grid lines
          borderData: FlBorderData(
            border: const Border(
              bottom: BorderSide(color: Colors.black, width: 1), // X-axis
              left: BorderSide(color: Colors.black, width: 1), // Y-axis
            ),
          ),
          barGroups: _getBarGroups(),
        ),
      ),
    );
  }

  List<BarChartGroupData> _getBarGroups() {
    return List.generate(
      data.length,
      (index) => BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: data[index].value,
            color: data[index].color,
            width: 10,
            borderRadius: BorderRadius.circular(1),
          ),
        ],
      ),
    );
  }
}
