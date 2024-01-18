import 'package:flutter/material.dart';
import 'package:food_list/presentation/view/main_view.dart';

/// We handle our main page's lifecycle like [initState]
/// and [didChangeDependencies]

mixin MainPageMixin on State<MainView> {
  ///
  List<String> foodList = [];

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
  }
}
