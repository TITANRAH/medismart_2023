import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../presentation/screens/screens.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(initialLocation: '/login', routes: [
    GoRoute(
      path: '/home-screen',
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),
  ]);
}
