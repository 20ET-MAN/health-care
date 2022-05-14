import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/src/domain/entities/user_entity.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/controller/booking_controller.dart';
import 'package:healthcare/src/presentation/controller/use_controller.dart';
import 'package:healthcare/src/presentation/route/routes.gr.dart';

import '../../config/app_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState({this.typeCurrentUser});

  @override
  void initState() {
    getTypeUser();
    getList();
    super.initState();
  }

  final List<PageRouteInfo> _itemsUser = [
    const HomePageRoute(),
    BookingPageRoute(),
    NotificationPageRoute(),
    const ProfilePageRoute()
  ];

  final List<PageRouteInfo> _itemsAdmin = [
    const HomePageRoute(),
    BookingListAdminRoute(),
    NotificationPageRoute(),
    const ProfilePageRoute()
  ];
  UserEntity? typeCurrentUser;

  Future<UserEntity?> getTypeUser() async {
    final typeUser =
        await UserController().getCurrentUser().then((value) => value);
    setState(() {
      typeCurrentUser = typeUser;
    });
    return typeCurrentUser;
  }

  final List<String> itemTitle = [
    'Trang chủ',
    'Đặt lịch',
    'Thông báo',
    'Thông tin cá nhân'
  ];

  List<PageRouteInfo> getList() {
    if (typeCurrentUser?.typeUser == 'user') {
      return _itemsUser;
    } else {
      return _itemsAdmin;
    }
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
        onPressed: () {
          BookingController().getBooking();
        },
        backgroundColor: AppColor.colorOrange,
        child: const Icon(
          Icons.message_outlined,
          color: AppColor.colorWhile,
        ),
      ),
      routes: getList(),
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
            (typeCurrentUser?.typeUser == 'user')
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
