import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sample/data/salesData/models/sales_data.dart';
import 'package:sample/utils/constants/colors.dart';
import 'package:sample/utils/constants/sizes.dart';

class LineGraph extends StatelessWidget {
  const LineGraph({
    super.key,
    required this.revenueDataPrev,
    required this.revenueDataCur,
  });

  final List<RevenueData> revenueDataPrev;
  final List<RevenueData> revenueDataCur;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.8, 
      child: Stack(
        children: [
          LineChart(
            LineChartData(
              gridData: const FlGridData(show: false),
              titlesData: FlTitlesData(
                
                leftTitles:  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();
                      if (index >= 0 && index < revenueDataPrev.length) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: KSizes.defaultSpace / 3),
                          child: Text(
                            revenueDataPrev[index].day,
                            style: const TextStyle(fontSize: KSizes.fontSizeSm / 1.2),
                          ),
                        );
                      }
                      return Container();
                    },
                    reservedSize: KSizes.spaceBtwItems * 6,
                  ),
                ),
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)), 
              ),
              borderData: FlBorderData(show: false),
              lineBarsData: [
              
                /// Previous Week Data
                LineChartBarData(
                  isCurved: true,
                  color: KColors.black.withOpacity(0.4),
                  
                  spots: revenueDataPrev.asMap().entries.map((e) => FlSpot(e.key.toDouble(),
                            e.value.revenue.isFinite ? e.value.revenue: 0,
                          ))
                      .toList(),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: const LinearGradient(
                      colors: [
                        KColors.white,
                        KColors.white
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  dotData: const FlDotData(show: false),
                  isStrokeCapRound: true,
                  barWidth: 2,
                ),
          
                // Current Week Data
                LineChartBarData(
                  isCurved: true,
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(0.8),
                      Colors.blue.withOpacity(0.4),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  spots: revenueDataCur.asMap().entries.map((e) => FlSpot(e.key.toDouble(),
                            e.value.revenue.isFinite ? e.value.revenue : 0)).toList(),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.shade100.withOpacity(0.1),
                        KColors.white
                      ],
                      stops: const [0.0, 1],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, barData, index) {
                      // Highlight the last data point with a pin-like indicator
                      if (index == revenueDataCur.length - 1) {
                        return FlDotCirclePainter(
                          radius: 3,
                          color: KColors.white,
                          strokeWidth: 5,
                          strokeColor: Colors.black,
                        );
                      }
                      return FlDotCirclePainter(
                        radius: 0,
                        color: Colors.blue,
                      );
                    },
                  ),
                  isStrokeCapRound: true,
                  barWidth: 2,
                ),
                
          
                
              ],
              minY: 0,
              minX: 0,
              maxY: [
                  ...revenueDataCur.map((e) => e.revenue),
                  ...revenueDataPrev.map((e) => e.revenue)
                ].reduce((a, b) => a > b ? a : b) + 300, // Add buffer
              
              // extraLinesData: ExtraLinesData(
              //   verticalLines: [
              //     VerticalLine(
              //       x: (revenueDataCur.length - 1).toDouble(),                    
              //       color: KColors.primary, 
              //       strokeWidth: 2,
              //     ),
                  
              //   ],
              //   // horizontalLines: [HorizontalLine(y: 999)]
              // ),
              
                lineTouchData: LineTouchData(
                  enabled: false, // Disable user interaction
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipColor: (touchedSpot) => const Color.fromRGBO(0, 0, 0, 1),
                    fitInsideVertically: true,
                    tooltipRoundedRadius: 10,
                    fitInsideHorizontally: true,
                    tooltipPadding: const EdgeInsets.all(KSizes.defaultSpace / 3),
                    tooltipMargin: 30,
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((spot) {
                        return LineTooltipItem(
                          "\$ ${spot.y.toStringAsFixed(0)}",
                          const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: KSizes.fontSizeSm
                          ),
                        );
                      }).toList();
                    },
                  ),
                  handleBuiltInTouches: true,
                ),
              
                showingTooltipIndicators: [
                  ShowingTooltipIndicators([
                    LineBarSpot(
                      LineChartBarData(
                        isCurved: true,
                        gradient: LinearGradient(
                          colors: [Colors.blue.withOpacity(0.8), Colors.blue.withOpacity(0.4)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        spots: revenueDataCur.asMap().entries
                            .map((e) => FlSpot(e.key.toDouble(), e.value.revenue))
                            .toList(),
                            
                      ),
                      0, // Index of the bar in lineBarsData (current week data = 0)
                      FlSpot(
                        (revenueDataCur.length - 1).toDouble(), // X-coordinate of the last data point
                        revenueDataCur.last.revenue, // Y-coordinate of the last data point
                      ),
                    ),
                ]),]
            ),
            
          ),
          Positioned(
            bottom: 100,
            left: ((MediaQuery.of(context).size.width * 0.8) / 6.125) * (revenueDataCur.length - 1),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    KColors.primary,
                    KColors.lightBlue
                  ],
                ),
                
              ),
              height: revenueDataCur[revenueDataCur.length - 1].revenue * 0.1875 ,
              width: 5,
            ),
          )
        ],
      ),
      
    );
  }
}
