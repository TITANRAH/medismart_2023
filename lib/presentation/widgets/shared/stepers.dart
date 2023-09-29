import 'package:flutter/material.dart';

class Stepers extends StatelessWidget {
  final bool isActiveOne;
  final bool isActiveTwo;
  final bool isActiveThree;
  const Stepers(
      {super.key,
      required this.isActiveOne,
      required this.isActiveTwo,
      required this.isActiveThree});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    const circleSize = 60.0;
    const activeColor = Colors.blue; // Color cuando está activo
    const inactiveColor = Colors.grey;
    // Color cuando está inactivo

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _CircleCustomSteper(
          circleSize: circleSize,
          isActive: isActiveOne,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          icon: Icons.person_outlined,
          steperText: '1. Seleccion',
        ),
        Icon(
          Icons.keyboard_arrow_right_outlined,
          color: colors.primary,
          size: 25,
        ),
        _CircleCustomSteper(
          circleSize: circleSize,
          isActive: isActiveTwo,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          icon: Icons.calendar_month_rounded,
          steperText: '2. Agendamiento',
        ),
        Icon(
          Icons.keyboard_arrow_right_outlined,
          color: colors.primary,
          size: 25,
        ),
        _CircleCustomSteper(
          circleSize: circleSize,
          isActive: isActiveThree,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          icon: Icons.check_circle_outline,
          steperText: '3. Confirmación',
        ),
      ],
    );
  }
}

class _CircleCustomSteper extends StatelessWidget {
  const _CircleCustomSteper({
    required this.circleSize,
    required this.isActive,
    required this.activeColor,
    required this.inactiveColor,
    required this.icon,
    required this.steperText,
  });

  final double circleSize;
  final bool isActive;
  final MaterialColor activeColor;
  final MaterialColor inactiveColor;
  final IconData icon;
  final String steperText;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleSmall;
    return Column(
      children: [
        Container(
          width: circleSize,
          height: circleSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? activeColor : inactiveColor,
            border: isActive
                ? Border.all(color: activeColor, width: 2.0)
                : null, // Borde solo cuando está activo
          ),
          child: Center(
              child: Icon(
            icon,
            size: 35,
            color: Colors.white,
          )),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          steperText,
          style: titleStyle!.copyWith(
              color: isActive ? Colors.amber.shade600 : inactiveColor),
        )
      ],
    );
  }
}
