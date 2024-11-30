import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/screens/map/MapScreem.dart';
import 'package:rick_and_morty/presentation/screens/screens.dart';

class MenuBottom extends StatefulWidget {
  const MenuBottom({super.key});

  @override
  State<MenuBottom> createState() => _MenuBottomState();
}

class _MenuBottomState extends State<MenuBottom> {
  int _currentIndex = 0;

  final List<Widget> _screens = [HomeScreen(), FavoritesScreen(), MapScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        width: fullWidth(context),
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(31, 87, 87, 87),
              offset: Offset(0, -2),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildMenuItem(
                index: 0,
                icon: Icons.home_outlined,
                label: "Home",
              ),
              _buildMenuItem(
                index: 1,
                icon: Icons.favorite_border_rounded,
                label: "Favoritos",
              ),
              _buildMenuItem(
                index: 2,
                icon: Icons.location_on_outlined,
                label: "Mapa",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      {required int index, required IconData icon, required String label}) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        padding: isSelected
            ? const EdgeInsets.symmetric(horizontal: 20, vertical: 2)
            : EdgeInsets.zero,
        decoration: BoxDecoration(
          color: isSelected ? Color.fromARGB(255, 44, 163, 231) : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color:
                  isSelected ? Colors.white : Color.fromARGB(255, 70, 73, 57),
            ),
            Text(
              label,
              style: TextStyle(
                color:
                    isSelected ? Colors.white : Color.fromARGB(255, 70, 73, 57),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
