import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medismart_2023/config/constants/env.dart';
import 'package:medismart_2023/config/router/app_router.dart';
import 'package:medismart_2023/config/theme/app_theme.dart';

void main() {
  Environments.setupEnv(Environment.qa);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routerConfig: appRouter,
      theme: AppTheme(selectedColor: 1).theme(),
    );
  }
}
