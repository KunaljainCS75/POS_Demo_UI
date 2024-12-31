import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/data/salesData/models/sales_data.dart';

// Dummy data provider
final filterDataProvider = Provider<Map<String, Map<String, int>>>((ref) {
  return {
    "1D": {"sold": 250, "onSale": 1000},
    "1W": {"sold": 2698, "onSale": 3027},
    "1M": {"sold": 5500, "onSale": 8750},
    "3M": {"sold": 12000, "onSale": 24500},
    "6M": {"sold": 25000, "onSale": 48900},
    "1Y": {"sold": 45000, "onSale": 95670},
  };
});

// StateProvider to track the selected filter
final selectedFilterProvider = StateProvider<String>((ref) => '1D');

final revenueCurrentWeekDataProvider = Provider<List<RevenueData>>((ref) {
  return [
    RevenueData("Mon", 500),
    RevenueData("Tue", 800),
    RevenueData("Wed", 900),
    RevenueData("Thu", 800),
    // RevenueData("Fri", 999),
    // RevenueData("Sat", 1400),
    // RevenueData("Sun", 2000),
  ];
});

final revenuePreviousWeekDataProvider = Provider<List<RevenueData>>((ref) {
  return [
    RevenueData("Mon", 400),
    RevenueData("Tue", 612),
    RevenueData("Wed", 550),
    RevenueData("Thu", 205),
    RevenueData("Fri", 600),
    RevenueData("Sat", 100),
    RevenueData("Sun", 375),
  ];
});
