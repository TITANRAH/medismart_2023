import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'custom_bottom_navigation_provider.g.dart';

@Riverpod(keepAlive: true)
class CustomBottomNavigationProvider extends _$CustomBottomNavigationProvider {
  Map<int, String> indexToRoute = {0: '/home-screen', 1: '/schedule', 2: 'user-history', 3: 'profile'};

  @override
  int build() {
    return 0;
  }

  void onItemTapped(int index, BuildContext context) {
    if (index != state) {
      state = index;
      if (state == 1) {
        context.pushReplacement(indexToRoute[index]!, extra: 'S');
      } else {
        context.pushReplacement(indexToRoute[index]!);
      }
    }
  }

  void changeEnableState(String route) {
    switch (route) {
      case '/schedule':
        state = 1;
        break;
    }
  }
}
