import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/screens/home/home_page.dart';

import '../booking_screen/booking_page.dart';
import '../notification_screen/notification_page.dart';
import '../profile_screen/profile_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bool isUser = true;

  int _selectedIndex = 0;

  void _onTapItem(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  final List<Widget> _itemsUser = [
    const HomePage(),
    const BookingPage(),
    NotificationPage(),
    const ProfileScreen(),
  ];

  final List<Widget> _itemsAdmin = [
    const HomePage(),
    const BookingPage(),
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
      extendBody:
          true, // todo thuoc tinh nay co the gay loi khi tinh toan man hinh
      backgroundColor: AppColor.appColorBg,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints layoutConstraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: layoutConstraints.maxHeight,
                minWidth: layoutConstraints.maxWidth,
                maxWidth: layoutConstraints.maxWidth,
                maxHeight: layoutConstraints.maxHeight),
            child: IntrinsicHeight(
              child: SafeArea(
                child: Center(
                  child: isUser
                      ? _itemsUser.elementAt(_selectedIndex)
                      : _itemsAdmin.elementAt(_selectedIndex),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: _showBottomNav(),
    );
  }

  Widget _showBottomNav() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 0,
            blurRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          // type: BottomNavigationBarType.fixed,
          backgroundColor: AppColor.colorWhile,
          selectedItemColor: AppColor.colorOrange,
          currentIndex: _selectedIndex,
          unselectedItemColor: AppColor.colorGrey,
          onTap: _onTapItem,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            isUser
                ? const BottomNavigationBarItem(
                    icon: Icon(Icons.perm_contact_calendar),
                    label: 'Booking',
                  )
                : const BottomNavigationBarItem(
                    icon: Icon(Icons.view_list),
                    label: 'Book List',
                  ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active_rounded),
              label: 'Notification',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
