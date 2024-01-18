import 'package:dart_vader/dart_vader.dart';
import 'package:flutter/material.dart';
import 'package:food_list/core/enum/lottie_path_enum.dart';
import 'package:food_list/core/extensions/context_extension.dart';
import 'package:food_list/presentation/mixin/home_page_mixin.dart';
import 'package:lottie/lottie.dart';

@immutable

/// Main page shows our food [List]
final class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with MainPageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: context.screenHeight,
          width: context.screenWidht,
          child: Column(
            children: [
              _mainPageLottie(),
              context.spacerWithFlex(flex: 5),
              _foodList(),
            ],
          ),
        ),
      ),
    );
  }

  /// Main page lottie animation.
  Widget _mainPageLottie() => Expanded(
        flex: 25,
        child: Lottie.asset(
          LottiePath.main.path,
          repeat: false,
        ),
      );

  /// [ListView]for food.
  Widget _foodList() => Expanded(
        flex: 70,
        child: SizedBox(
          child: ListView.builder(
            itemCount: foodList.length,
            itemBuilder: (context, index) => ListTile(
              //TODO: Must  be part part of
              title: Text(
                foodList[index],
                style: context.openSans.copyWith(
                  fontWeight: context.fontWeightBold,
                ),
              ),
            ),
          ),
        ),
      );
}
