
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../providers/app_theme_provider.dart';


class StatisticsChart extends StatelessWidget {
  const StatisticsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (builderContext) {
        final themeProvider = builderContext.watch<AppThemeProvider>();
        final isDark =
            themeProvider.appTheme == ThemeMode.dark ||
                (themeProvider.appTheme == ThemeMode.system &&
                    MediaQuery.of(builderContext).platformBrightness == Brightness.dark);

        // final labelStyle = AppTextStyle.medium12TextBody(builderContext);

        return SizedBox(
          height: MediaQuery.of(builderContext).size.width > 600 ? 248.h : 208.h,
          child: Padding(
            padding: EdgeInsets.only(right: 14.33.w, left: 10.w, top: 10.5.h),
            child: LineChart(
              LineChartData(
                minY: 0,
                maxY: 100,
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: 25,
                  verticalInterval: 1,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: isDark
                          ? AppColors.border_card_default_dark
                          : AppColors.border_card_default_light,
                      strokeWidth: 1.w,
                      dashArray: [4, 4],
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: isDark
                          ? AppColors.border_card_default_dark
                          : AppColors.border_card_default_light,
                      strokeWidth: 1.w,
                      dashArray: [4, 4],
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 25,
                      reservedSize: 32.w,
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: Center(
                            child: Text(
                              value.toInt().toString(),
                              // style: labelStyle,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      reservedSize: MediaQuery.of(builderContext).size.width > 600
                          ? 27.h
                          : 22.h,
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        const months = [
                          'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul',
                        ];
                        if (value.toInt() >= months.length) {
                          return const SizedBox();
                        }
                        return Padding(
                          padding: EdgeInsets.only(top: 6.h),
                          child: Text(
                            months[value.toInt()],
                            // style: labelStyle,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    left: BorderSide(
                      width: 1.w,
                      color: isDark
                          ? AppColors.border_card_default_dark
                          : AppColors.border_card_default_light,
                    ),
                    bottom: BorderSide(
                      width: 1.w,
                      color: isDark
                          ? AppColors.border_card_default_dark
                          : AppColors.border_card_default_light,
                    ),
                    top: BorderSide(
                      width: 0.2.w,
                      color: isDark
                          ? AppColors.border_card_default_dark
                          : AppColors.border_card_default_light,
                    ),
                    right: BorderSide(
                      width: 0.2.w,
                      color: isDark
                          ? AppColors.border_card_default_dark
                          : AppColors.border_card_default_light,
                    ),
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 10),
                      FlSpot(1, 13),
                      FlSpot(2, 10),
                      FlSpot(3, 15),
                      FlSpot(4, 16),
                      FlSpot(5, 17),
                      FlSpot(6, 17.5),
                    ],
                    barWidth: 2,
                    color: isDark
                        ? const Color.fromARGB(255, 63, 157, 168)
                        : AppColors.primary_default_light,
                    dotData: FlDotData(show: true),
                  ),
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 36),
                      FlSpot(1, 37),
                      FlSpot(2, 40),
                      FlSpot(3, 29),
                      FlSpot(4, 35),
                      FlSpot(5, 31.5),
                      FlSpot(6, 38),
                    ],
                    barWidth: 2,
                    color: isDark
                        ? AppColors.icon_onLight_dark
                        : AppColors.icon_onLight_light,
                    dotData: FlDotData(show: true),
                  ),
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 78),
                      FlSpot(1, 80),
                      FlSpot(2, 50),
                      FlSpot(3, 90),
                      FlSpot(4, 78),
                      FlSpot(5, 65.5),
                      FlSpot(6, 75),
                    ],
                    barWidth: 2,
                    color: isDark
                        ? AppColors.secondary_default_dark
                        : AppColors.secondary_default_light,
                    dotData: FlDotData(show: true),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}