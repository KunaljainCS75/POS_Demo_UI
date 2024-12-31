import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/common/widgets/appbar.dart';
import 'package:sample/common/widgets/text.dart';
import 'package:sample/utils/constants/colors.dart';
import 'package:sample/utils/constants/sizes.dart';

class ScanScreen extends ConsumerStatefulWidget {
  const ScanScreen({super.key});

  static route() => MaterialPageRoute(builder: (context) => const ScanScreen()); 

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScanScreenState();
}

class _ScanScreenState extends ConsumerState<ScanScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: const KAppBar(
        showBackArrow: true,
        title:  Center(
          child: KText(text: "Scan Products",textAlign: TextAlign.center, 
                      weight: FontWeight.w600),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(KSizes.defaultSpace),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,        
            children: [
              Image.asset("assets/icons/scanner.png"),
              const SizedBox(height: KSizes.spaceBtwSections * 3),
              const KText(text: "Scanning Product", weight: FontWeight.w500, size: 24),
              const SizedBox(height: KSizes.spaceBtwItems),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const KText(text: "The scan result will be automatically added if the item exists.", 
                      weight: FontWeight.w500, size: 12, maxlines: 2, textAlign: TextAlign.center),
              ),
              const SizedBox(height: KSizes.spaceBtwSections),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: KColors.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(KSizes.cardRadiusSm))
                ), 
                child: const KText(text: "OK", color: KColors.white)
              )
            ],
          ),
        ),
      ),
    );
  }
}