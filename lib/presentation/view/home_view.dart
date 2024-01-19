import 'package:dart_vader/dart_vader.dart';
import 'package:flutter/material.dart';
import 'package:food_list/core/constants/constants.dart';
import 'package:food_list/core/enum/lottie_path_enum.dart';
import 'package:food_list/core/extensions/context_extension.dart';
import 'package:food_list/core/widgets/error_widgets.dart';
import 'package:food_list/core/widgets/loading_widgets.dart';
import 'package:food_list/presentation/mixin/home_page_mixin.dart';
import 'package:lottie/lottie.dart';

import '../modelview/home_view_model.dart';

part '../widgets/home_view_listtile.dart';
part '../widgets/home_view_list_name.dart';

@immutable

/// Main page shows our food [List]
final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
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
              _normalMenuName(),
              context.spacerWithFlex(flex: 5),
              _foodListFutureBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  /// Normal menu name text.
  /// Part of [HomeView]
  Widget _normalMenuName() => _NormalMenuNameText(viewModel: viewModel);

  /// Main page lottie animation.
  Widget _mainPageLottie() => Expanded(
        flex: 25,
        child: Lottie.asset(
          LottiePath.main.path,
          repeat: false,
        ),
      );

  /// [FutureBuilder] for food list.
  Widget _foodListFutureBuilder() => Expanded(
        flex: 65,
        child: SizedBox(
          child: FutureBuilder(
            future: viewModel.getNormalFoodList(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return ErrorWidgets.errorText;
                case ConnectionState.waiting:
                  return LoadingWidgets.circularProgressIndicator;
                case ConnectionState.active:
                  return LoadingWidgets.circularProgressIndicator;
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    return _foodsListView(snapshot.data!, snapshot.data!.length);
                  } else {
                    return ErrorWidgets.errorText;
                  }
              }
            },
          ),
        ),
      );

  /// [ListView] for food
  Widget _foodsListView(List<String> title, int index) {
    return ListView.builder(
      itemCount: index,
      itemBuilder: (context, index) => _HomeViewListTile(
        title: title[index],
      ),
    );
  }
}
