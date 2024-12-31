import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/common/widgets/appbar.dart';
import 'package:sample/common/widgets/product_count_container.dart';
import 'package:sample/common/widgets/product_info_tile.dart';
import 'package:sample/common/widgets/text.dart';
import 'package:sample/features/scan/scan_screen.dart';
import 'package:sample/utils/constants/colors.dart';
import 'package:sample/utils/constants/sizes.dart';

class Product extends ConsumerStatefulWidget {
  const Product({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductState();
}

class _ProductState extends ConsumerState<Product> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: Text("Products", 
                    textAlign: TextAlign.center, 
                    style: GoogleFonts.poppins(color: KColors.textPrimary, fontWeight: FontWeight.w600),
                ),
        showBackArrow: false,
        actions: [
          IconButton(onPressed: () => Navigator.of(context).push(ScanScreen.route()), 
                     icon: Image.asset("assets/icons/scan.png", height: 24)),
          IconButton(onPressed: () {}, icon: Image.asset("assets/icons/search.png", height: 24))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child: ProductCountContainer(
                      heading: "Total Products", count: "128", percentage: "+8.00%"),
                  ),
                  Expanded(
                    child: ProductCountContainer(
                      heading: "Products in hand", count: "2,350", percentage: "+2.34%",
                      color0: KColors.lightBlue.withOpacity(0.5) ,color1: KColors.secondary, color3: KColors.secondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: KSizes.spaceBtwSections),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const KText(text: "Products", color: KColors.textSecondary, weight: FontWeight.w500),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.only(right: KSizes.defaultSpace / 2),
                      child: Image.asset("assets/icons/filter.png", height: 24),
                    ),
                  )
                ],
              ),
              const ProductInfoTile(upCount: "267", downCount: "149", infoText: "Scans", color: KColors.lightGreen),
              const ProductInfoTile(upCount: "124", downCount: "87", infoText: "Prints", color: KColors.lightBlue),
              const ProductInfoTile(upCount: "88", downCount: "27", infoText: "Folders", color: KColors.lightOrange, isLow: true),
              const ProductInfoTile(upCount: "450", downCount: "234", infoText: "Online Procedures", color: KColors.lightGreen)
            ],
          ),
        ),
      ),
    );
  }
}

