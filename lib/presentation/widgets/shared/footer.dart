import 'package:flutter/material.dart';

class Powered extends StatelessWidget {
  final Color color;
  const Powered({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
   
    final titleStyle = Theme.of(context).textTheme.titleSmall;

    return Column(
      children: [
        Text(
          'Powered by',
          style: titleStyle!.copyWith(color: color),
        ),
        Text(
          'Medismart.live',
          style: titleStyle.copyWith(color: color),
        ),
        Text(
          '2023 ©  Medical',
          style: titleStyle.copyWith(color: color),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Términos y condiciones',
              style: titleStyle.copyWith(color:color),
            ),
            Text(
              'Políticas de seguridad',
              style: titleStyle.copyWith(color: color),
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
