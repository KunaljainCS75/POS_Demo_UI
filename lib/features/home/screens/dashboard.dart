import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/common/widgets/appbar.dart';
import 'package:sample/common/widgets/rounded_container.dart';
import 'package:sample/common/widgets/text.dart';
import 'package:sample/data/salesData/sales_data/sales_data.dart';
import 'package:sample/features/home/widgets/graph.dart';
import 'package:sample/utils/constants/colors.dart';
import 'package:sample/utils/constants/sizes.dart';
class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {

  @override
  Widget build(BuildContext context) {
    // get Time state
    final selectedTime = ref.watch(selectedFilterProvider);
    // get salesData state
    final data = ref.watch(filterDataProvider)[selectedTime];
    // get revenueData state
    final revenueDataCur = ref.watch(revenueCurrentWeekDataProvider);
    final revenueDataPrev = ref.watch(revenuePreviousWeekDataProvider);

    double currentWeekSum = revenueDataCur.fold(0, (sum, data) => sum + data.revenue);
    double previousWeekSum = revenueDataPrev.take(revenueDataCur.length).fold(0, (sum, data) => sum + data.revenue);

    // profit percentage
    double percentage = ((currentWeekSum - previousWeekSum) / previousWeekSum) * 100;

    return Scaffold(
      appBar: const KAppBar(
        showBackArrow: false,
        title:  Center(
          child: KText(text: "Administration CiberNautica",textAlign: TextAlign.center, 
                      weight: FontWeight.w600),
        )
      ),

      body: Padding(
        padding: const EdgeInsets.all(KSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Summary Box
              Column(
                children: [
                  Row(
                    children: [
                      RoundedContainer(
                        assetImage: "assets/icons/pie_chart.png",
                        text1: "${data!["onSale"]}",
                        text2: "For Sale",
                      ),
                      const SizedBox(width: KSizes.spaceBtwItems),
                      RoundedContainer(
                        assetImage: "assets/icons/pie_chart.png",
                        text1: "${data["sold"]}",
                        text2: "Sold",
                        backgroundColor: KColors.secondary,
                      ),
                    ],
                  ),
                  const SizedBox(height: KSizes.spaceBtwSections),
                  
                  // Summary Filter
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                        filterButton(ref, '1D'),
                        filterButton(ref, '1W'),
                        filterButton(ref, '1M'),
                        filterButton(ref, '3M'),
                        filterButton(ref, '6M'),
                        filterButton(ref, '1Y'),
                    ],
                  ),
                  const SizedBox(height: KSizes.spaceBtwSections),
          
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Revenue", style: GoogleFonts.poppins(color: const Color(0xFF737D93),fontSize: KSizes.fontSizeLg, fontWeight: FontWeight.w400)),
                      Row(
                        children: [
                          Text("\$$currentWeekSum", style: GoogleFonts.poppins(fontSize: KSizes.fontSizeLg * 1.5, fontWeight: FontWeight.w600)), 
                          const SizedBox(width: KSizes.spaceBtwSections),
                          ElevatedButton(
                            onPressed: () {}, 
                            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFECF5EE), elevation: 0.0),
                            child: Row(
                              children: [
                                Text(percentage >= 0 ? "+" : "-",  style: GoogleFonts.poppins(color: const Color(0xFF458F5A), fontSize: KSizes.fontSizeLg, fontWeight: FontWeight.w500),),
                                Text("${percentage.toStringAsFixed(1)} %", style: GoogleFonts.poppins(color: const Color(0xFF458F5A), fontSize: KSizes.fontSizeLg, fontWeight: FontWeight.w500),),
                              ],
                            )
                          )
                        ]
                      )
                    ],
                  ),
                  const SizedBox(height: KSizes.spaceBtwSections),
                  LineGraph(revenueDataPrev: revenueDataPrev, revenueDataCur: revenueDataCur),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



// Filter button for dashboard
 Widget filterButton(WidgetRef ref, String label) {
    final selectedFilter = ref.watch(selectedFilterProvider);
    final isSelected = selectedFilter == label;

    return GestureDetector(
      // Update the selected filter
      onTap: () => ref.read(selectedFilterProvider.notifier).state = label, 
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? KColors.primary : Colors.grey.withOpacity(0.1),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(color: isSelected ? KColors.white : Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
