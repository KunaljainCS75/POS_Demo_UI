import 'package:flutter/material.dart';
import 'package:sample/utils/constants/colors.dart';
import 'package:sample/utils/constants/sizes.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KAppBar(
      {super.key,
        this.title,
        this.showBackArrow = true,
        this.leadingIcon,
        this.actions,
        this.leadingOnPressed,
        this.padding = const EdgeInsets.symmetric(horizontal: KSizes.md),
        this.bgColor
      });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final EdgeInsetsGeometry padding;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Padding(padding: padding,
        child: AppBar(

          // forceMaterialTransparency: true,
          automaticallyImplyLeading: false,
          leading: showBackArrow?
            IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_left), color: dark? KColors.white : KColors.black.withOpacity(0.8)):
            leadingIcon != null ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)) : null,

          title: title,
          actions: actions,
          backgroundColor: bgColor,
        )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}