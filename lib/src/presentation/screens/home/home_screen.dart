import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/route/routes.gr.dart';

import '../../config/app_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bool isUser = true;

  final PageController _pageController = PageController();

  final List<PageRouteInfo> _itemsUser = [
    const HomePageRoute(),
    const BookingPageRoute(),
    NotificationPageRoute(),
    const ProfilePageRoute()
  ];

  final List<PageRouteInfo> _itemsAdmin = [
    const HomePageRoute(),
    BookingListAdminRoute(),
    NotificationPageRoute(),
    const ProfilePageRoute()
  ];

  final List<String> itemTitle = [
    'Trang chủ',
    'Đặt lịch',
    'Thông báo',
    'Thông tin cá nhân'
  ];

  void onItemTap(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (_, tabRouter) {
        return AppBar(
          elevation: 0.5,
          backgroundColor: AppColor.colorWhile,
          title: Text(
            itemTitle[tabRouter.activeIndex],
            style: AppStyle().heading2.copyWith(fontSize: 27),
          ),
          centerTitle: true,
        );
      },
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColor.colorOrange,
        child: const Icon(
          Icons.message_outlined,
          color: AppColor.colorWhile,
        ),
      ),
      routes: isUser ? _itemsUser : _itemsAdmin,
      bottomNavigationBuilder: (_, tabRouter) {
        return BottomNavigationBar(
          backgroundColor: AppColor.colorWhile,
          selectedItemColor: AppColor.colorOrange,
          currentIndex: tabRouter.activeIndex,
          unselectedItemColor: AppColor.colorGrey,
          onTap: tabRouter.setActiveIndex,
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
        );
      },
    );
  }
}
