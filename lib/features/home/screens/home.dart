import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/features/home/screens/dashboard.dart';
import 'package:sample/features/home/screens/product.dart';
import 'package:sample/features/home/screens/settings.dart';
import 'package:sample/features/home/screens/transaction.dart';
import 'package:sample/utils/constants/colors.dart';

class HomeScreen extends ConsumerStatefulWidget {
  // helps to maintain index of tabs
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomeScreen> {
  int selectedIndex = 0;
  final pages = [
    const Dashboard(),
    const Product(),
    const Transaction(),
    const Settings()
  ];

  @override
  Widget build(BuildContext context) {
    // final user = ref.watch(currentUserNotifierProvider);
    // print(user);
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Image.asset("assets/icons/home.png",
                    height: 24, width: 24,
                    color: selectedIndex == 0
                      ? KColors.primary
                      : KColors.tertiary
                    ),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Image.asset("assets/icons/product.png",
                    height: 24, width: 24,
                    color: selectedIndex == 1
                      ? KColors.primary
                      : KColors.tertiary
                    ),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: selectedIndex == 2 ? KColors.primary : KColors.tertiary
                ),
                child: const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(Icons.bar_chart,
                        size: 24,
                        color: Colors.white 
                        ),
                ),
              ),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Image.asset("assets/icons/settings.png",
                    height: 24, width: 24,
                    color: selectedIndex == 3
                      ? KColors.primary
                      : KColors.tertiary
                    ),
              label: ''
          ),
        ],
      ),
      
    );
  }
}