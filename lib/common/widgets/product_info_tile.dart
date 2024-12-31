import 'package:flutter/material.dart';
import 'package:sample/common/widgets/text.dart';
import 'package:sample/utils/constants/colors.dart';
import 'package:sample/utils/constants/sizes.dart';

class ProductInfoTile extends StatelessWidget {
  const ProductInfoTile({
    super.key, 
    required this.upCount, 
    required this.downCount, 
    required this.infoText, 
    required this.color,
    this.isLow = false
  });

  final String upCount;
  final String downCount;
  final String infoText;
  final Color color;
  final bool isLow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: KSizes.spaceBtwItems),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(backgroundColor: color, radius: KSizes.cardRadiusLg),
              const SizedBox(width: KSizes.spaceBtwItems * 1.2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      KText(text: infoText, size: 16, weight: FontWeight.w500),
                      if (isLow) const SizedBox(width: KSizes.spaceBtwItems),
                      isLow 
                        ? ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                              padding: const EdgeInsets.symmetric(horizontal: KSizes.spaceBtwItems / 2),
                              backgroundColor: KColors.lightOrange,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(KSizes.cardRadiusSm))
                            ), 
                            child: const KText(text: "Low Stock", color: KColors.loss, size: KSizes.fontSizeSm, weight: FontWeight.w500)
                        )
                        : const SizedBox()
                    ],
                  ),
                  const SizedBox(height: KSizes.spaceBtwItems),
                  Row(
                    children: [
                      Image.asset("assets/icons/upArrow.png", height: KSizes.fontSizeLg / 1.7),
                      const SizedBox(width: KSizes.spaceBtwItems / 2),
                      KText(text: upCount, color: KColors.profit),
                      const SizedBox(width: KSizes.spaceBtwItems),
                      Image.asset("assets/icons/downArrow.png", height: KSizes.fontSizeLg / 1.7),
                      const SizedBox(width: KSizes.spaceBtwItems / 2),
                      KText(text: upCount, color: KColors.loss)
                    ],
                  ),
          
                ]
              )
            ],
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_right, color: KColors.textSecondary, size: 30))
        ],
      ),
    );
  }
}

