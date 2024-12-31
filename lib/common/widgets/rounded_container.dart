
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/utils/constants/colors.dart';
import 'package:sample/utils/constants/sizes.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    super.key, 
    this.borderRadius = KSizes.borderRadiusLg,
    this.backgroundColor = KColors.primary, 
    this.text1 = "Value", 
    this.text2 = "Label", 
    required this.assetImage,
  });

  final Color backgroundColor;
  final double borderRadius;
  final String text1;
  final String text2;
  final String assetImage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: backgroundColor
        ),
        child: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(assetImage, height: 20),
              const SizedBox(height: KSizes.spaceBtwItems),
              Text(text1, style: GoogleFonts.poppins(color: KColors.white, fontSize: KSizes.fontSizeLg)),
              Text(text2, style: GoogleFonts.poppins(color: KColors.white, fontSize: KSizes.fontSizeSm)),
            ],
          ),
        ),
      ),
    );
  }
}