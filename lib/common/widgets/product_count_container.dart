import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/common/widgets/text.dart';
import 'package:sample/utils/constants/colors.dart';
import 'package:sample/utils/constants/sizes.dart';

class ProductCountContainer extends StatelessWidget {
  const ProductCountContainer({
    super.key, 
    required this.heading, 
    required this.count, 
    required this.percentage,
    this.height = 32,
    this.width = 100,
    this.color0 = KColors.lightGreen,
    this.color1 = KColors.profit, 
    this.color2 = KColors.white, 
    this.color3 = KColors.profit
  });

  final String heading;
  final String count;
  final String percentage;
  final double? height;
  final double? width;
  final Color color0;
  final Color color1;
  final Color color2;
  final Color color3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KText(text: heading, size: 14, color: KColors.textSecondary),
        const SizedBox(height: KSizes.spaceBtwItems / 2),
        KText(text: count.toString(), size: 32, weight: FontWeight.w500),
        ValueContainer(color0: color0, color1: color1, color2: color2, color3: color3, 
                       percentage: percentage, height: height, width: width, isIcon: true)
      ]
    );
  }
}

class ValueContainer extends StatelessWidget {
  const ValueContainer({
    super.key,
    required this.color0,
    required this.color1,
    required this.color2,
    required this.color3,
    this.isIcon = false,
    this.height,
    this.icon = CupertinoIcons.up_arrow, 
    this.iconSize = 10,
    this.width,
    required this.percentage,
  });

  final Color color0;
  final Color color1;
  final Color color2;
  final Color color3;
  final double? height;
  final double? width;
  final double? iconSize;
  final bool isIcon;
  final String percentage;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {}, 
      style: ElevatedButton.styleFrom(
          backgroundColor: color0,
          padding: const EdgeInsets.symmetric(horizontal: KSizes.spaceBtwItems / 2), 
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(KSizes.cardRadiusSm / 2)),
      ),
      child: SizedBox(
        height: height, width: width,
        child: Row(
          children: [
            Container(
            decoration: BoxDecoration(
                color: color1,
                borderRadius: const BorderRadius.all(Radius.circular(KSizes.cardRadiusSm / 2))
                ),
              child: isIcon ? Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(icon, size: iconSize, color: color2),
              ) : null,
            ),
            if (isIcon) const SizedBox(width: KSizes.spaceBtwItems),
            // ignore: unnecessary_brace_in_string_interps
            KText(text: percentage, color: color3, size: 14, weight: FontWeight.w500)
          ],
        ),
      )
    );
  }
}
