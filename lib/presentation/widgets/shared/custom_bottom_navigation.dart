import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medismart_2023/presentation/providers/providers.dart';

class CustomBottomNavigation extends ConsumerStatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  CustomBottomNavigationState createState() => CustomBottomNavigationState();
}

class CustomBottomNavigationState extends ConsumerState<CustomBottomNavigation> {



  @override
  void initState() {
    super.initState();

  }

  @override
  void didChangeDependencies() {
    // ref.watch(customBottomNavigationProviderProvider);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final selectedIndex = ref.watch(customBottomNavigationProviderProvider);

    return BottomNavigationBar(
      currentIndex: selectedIndex,
      selectedFontSize: 19,
      unselectedFontSize: 15,
      selectedItemColor: colors.primary,
      onTap: (value) {
        ref.watch(customBottomNavigationProviderProvider.notifier).onItemTapped(value, context);
      },
      type: BottomNavigationBarType.fixed,
      elevation: 10,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: 'Telemedicina',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.medical_information_outlined),
          label: 'Historial',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_pin),
          label: 'Perfil',
        ),
      ],
    );
  }
}
