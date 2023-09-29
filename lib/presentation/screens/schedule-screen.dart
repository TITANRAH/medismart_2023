import 'package:flutter/material.dart';
import 'package:medismart_2023/presentation/widgets/widgets.dart';

class ScheduleScreen extends StatelessWidget {
  static const name = 'schedule';
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigation(),
      backgroundColor: colors.onPrimary,
      appBar: CustomAppBar(
        backgroundColor: colors.onPrimary,
        iconColor: colors.primary,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Stepers(
              isActiveOne: true,
              isActiveTwo: false,
              isActiveThree: false,
            ),
          ],
        ),
      ),
    );
  }
}
