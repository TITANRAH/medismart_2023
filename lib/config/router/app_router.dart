import 'package:go_router/go_router.dart';
import 'package:medismart_2023/domain/entities/medical-directory/medical_directory.dart';
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
    GoRoute(
      path: '/schedule',
      name: ScheduleScreen.name,
      // builder: (context, state) => const ScheduleScreen(),
      builder: (context, state) {
         final tipoServicio = state.extra! as String?;
            return ScheduleScreen(
              tipoServicio: tipoServicio,
            );
      },
    ),
    GoRoute(
      path: '/scheduling',
      name: SchedulingScreen.name,
      // builder: (context, state) => const ScheduleScreen(),
      builder: (context, state) {
         final idDoctor = state.extra! as int;
            return SchedulingScreen(
              idDoctor: idDoctor,
            );
      },
    ),
  ]);
}
