import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.isShow = true}) : super(key: key);
  final bool isShow;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bool isShow = true;

  int _selectedIndex = 0;

  void _onTapItem(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  final List<Widget> _items = [
    const Text(
      'Index 0: Home',
    ),
    const Text(
      'Index 1: Profile',
    ),
    const Text(
      'Index 3: Shop',
    ),
    const Text(
      'Index 4: Shop',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorGrey,
      appBar: AppBar(
        actions: [
          Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black, width: 1, style: BorderStyle.solid),
              ),
              child: const Icon(Icons.ac_unit)),
        ],
      ),
      body: Center(
        child: _items.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: _showBottomNav(),
    );
  }

  Widget _showBottomNav() {
    return BottomNavigationBar(
      backgroundColor: AppColor.colorWhile,
      selectedItemColor: AppColor.colorOrange,
      currentIndex: _selectedIndex,
      unselectedItemColor: Colors.grey,
      onTap: _onTapItem,
      elevation: 2,
      items: [
        isShow
            ? const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              )
            : const BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile',
              ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Shop',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.ac_unit_outlined),
          label: 'Unit',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.accessibility_new),
          label: 'Man',
        ),
      ],
    );
  }
}
