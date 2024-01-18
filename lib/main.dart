import 'package:flutter/material.dart';
import 'package:food_list/core/constants/constants.dart';
import 'package:food_list/core/init/app_init.dart';
import 'package:food_list/presentation/view/home_view.dart';

Future<void> main() async {
  await AppInit.init();
  runApp(const FoodList());
}

/// Root of our application.
class FoodList extends StatelessWidget {
  const FoodList({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.marmaraBlue),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
