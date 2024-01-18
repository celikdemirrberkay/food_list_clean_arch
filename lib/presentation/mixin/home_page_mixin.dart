import 'package:flutter/material.dart';
import 'package:food_list/domain/use_case/get_normal_food_list.dart';
import 'package:food_list/presentation/modelview/home_view_model.dart';
import 'package:food_list/presentation/view/home_view.dart';

import '../../data/dependencyinjection/injection_container.dart';

/// We handle our main page's lifecycle like [initState]
/// and [didChangeDependencies]

mixin HomeViewMixin on State<HomeView> {
  /// View Model object
  final HomeViewViewModel viewModel = HomeViewViewModel(sl(), sl());
}
