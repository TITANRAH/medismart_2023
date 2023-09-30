import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? iconColor;
  final Color? backgroundColor;
  const CustomAppBar({
    Key? key,
    this.iconColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      automaticallyImplyLeading: true,
      backgroundColor: backgroundColor,
      leading: IconButton(
        iconSize: 30,
        color: iconColor,
        icon: const Icon(
            Icons.arrow_back_ios_new_outlined), // Icono a la izquierda
        onPressed: () {
          context.pop();
        },
      ),
      actions: [
        IconButton(
          iconSize: 30,
          color: iconColor,
          icon: const Icon(Icons.calendar_month),
          onPressed: () {},
        ),
        IconButton(
          iconSize: 30,
          color: iconColor,
          icon: const Icon(Icons.question_mark_sharp),
          onPressed: () {},
        ),
        IconButton(
          iconSize: 30,
          color: iconColor,
          icon: const Icon(Icons.logout_outlined),
          onPressed: () {},
        ),
      ],
      // title: const Text('Mi AppBar Personalizado'),
      // centerTitle: true,
    );
  }
}
