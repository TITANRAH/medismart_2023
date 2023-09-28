import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 19,
      unselectedFontSize: 15,
      type: BottomNavigationBarType.fixed,
      elevation: 10,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
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
