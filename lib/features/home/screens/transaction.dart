import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/common/widgets/appbar.dart';

import '../../../common/widgets/text.dart';

class Transaction extends ConsumerStatefulWidget {
  const Transaction({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TransactionState();
}

class _TransactionState extends ConsumerState<Transaction> {

  @override
  Widget build(BuildContext context) {
     return const Scaffold(
     appBar: KAppBar(
        showBackArrow: false,
        title:  Center(
          child: KText(text: "Transactions",textAlign: TextAlign.center, 
                      weight: FontWeight.w600),
        )
      ),
    );
  }
}