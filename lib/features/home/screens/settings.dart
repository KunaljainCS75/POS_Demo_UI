import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/common/widgets/appbar.dart';
import 'package:sample/common/widgets/text.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<Settings> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
     appBar: KAppBar(
        showBackArrow: false,
        title:  Center(
          child: KText(text: "Settings",textAlign: TextAlign.center, 
                      weight: FontWeight.w600),
        )
      ),
    );
  }
}