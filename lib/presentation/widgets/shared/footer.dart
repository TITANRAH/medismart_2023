import 'package:flutter/material.dart';

class Powered extends StatelessWidget {
  const Powered({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleSmall;

    return Column(
      children: [
        Text(
          'Powered by',
          style: titleStyle!.copyWith(color: colors.onSecondary),
        ),
        Text(
          'Medismart.live',
          style: titleStyle.copyWith(color: colors.onSecondary),
        ),
        Text(
          '2023 ©  Medical',
          style: titleStyle.copyWith(color: colors.onSecondary),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Términos y condiciones',
              style: titleStyle.copyWith(color: colors.onSecondary),
            ),
            Text(
              'Políticas de seguridad',
              style: titleStyle.copyWith(color: colors.onSecondary),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
