// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i27;
import 'package:flutter/material.dart' as _i28;

import '../../domain/entities/booking_entity.dart' as _i31;
import '../../domain/entities/doctor_entity.dart' as _i29;
import '../../domain/entities/news_entity.dart' as _i30;
import '../../domain/entities/user_entity.dart' as _i32;
import '../screens/booking_screen/booking_end.dart' as _i17;
import '../screens/booking_screen/booking_list%20_user.dart' as _i18;
import '../screens/booking_screen/booking_list.dart' as _i24;
import '../screens/booking_screen/booking_list_detail_admin.dart' as _i10;
import '../screens/booking_screen/booking_page.dart' as _i23;
import '../screens/brand/brand_page.dart' as _i3;
import '../screens/doctor/create_doctor.dart' as _i16;
import '../screens/doctor/doctor_detail.dart' as _i8;
import '../screens/doctor/doctor_page.dart' as _i6;
import '../screens/home/home_page.dart' as _i22;
import '../screens/home/home_screen.dart' as _i2;
import '../screens/login_screen/login_page.dart' as _i4;
import '../screens/map/near_hospital.dart' as _i7;
import '../screens/message/chat_room.dart' as _i20;
import '../screens/message/contact_list.dart' as _i19;
import '../screens/news_page/new_detail.dart' as _i9;
import '../screens/notification_screen/notification_page.dart' as _i25;
import '../screens/profile_screen/profile_page.dart' as _i26;
import '../screens/profile_screen/user_profile_info.dart' as _i14;
import '../screens/register/create_user.dart' as _i15;
import '../screens/register/register_end.dart' as _i21;
import '../screens/register/register_first.dart' as _i5;
import '../screens/splash_screen.dart' as _i1;
import '../screens/web_view/covid_data_page.dart' as _i12;
import '../widget/help_center.dart' as _i13;
import '../widget/service_page.dart' as _i11;

class AppRouter extends _i27.RootStackRouter {
  AppRouter([_i28.GlobalKey<_i28.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i27.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    HomeScreenRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeScreen());
    },
    BrandPageRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.BrandPage());
    },
    LoginPageRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.LoginPage());
    },
    RegisterFirstRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.RegisterFirst());
    },
    DoctorPageRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.DoctorPage());
    },
    NearHospitalRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.NearHospital());
    },
    DoctorDetailRoute.name: (routeData) {
      final args = routeData.argsAs<DoctorDetailRouteArgs>();
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i8.DoctorDetail(key: args.key, doctorEntity: args.doctorEntity));
    },
    NewsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailRouteArgs>();
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.NewsDetail(key: args.key, item: args.item));
    },
    BookingListDetailAdminRoute.name: (routeData) {
      final args = routeData.argsAs<BookingListDetailAdminRouteArgs>();
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.BookingListDetailAdmin(
              key: args.key, bookingListEntity: args.bookingListEntity));
    },
    ServiceWebViewRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.ServiceWebView());
    },
    CovidDataPageRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.CovidDataPage());
    },
    HelpCenterRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.HelpCenter());
    },
    UserProfileInfoRoute.name: (routeData) {
      final args = routeData.argsAs<UserProfileInfoRouteArgs>();
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.UserProfileInfo(key: args.key, user: args.user));
    },
    CreateUserPageRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.CreateUserPage());
    },
    CreateDoctorRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.CreateDoctor());
    },
    BookingEndRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.BookingEnd());
    },
    BookingListUserRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.BookingListUser());
    },
    ContactListRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.ContactList());
    },
    ChatRoomRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.ChatRoom());
    },
    RegisterEndRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i21.RegisterEnd());
    },
    HomePageRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i22.HomePage());
    },
    BookingPageRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i23.BookingPage());
    },
    BookingListAdminRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i24.BookingListAdmin());
    },
    NotificationPageRoute.name: (routeData) {
      final args = routeData.argsAs<NotificationPageRouteArgs>(
          orElse: () => const NotificationPageRouteArgs());
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i25.NotificationPage(key: args.key));
    },
    ProfilePageRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i26.ProfilePage());
    }
  };

  @override
  List<_i27.RouteConfig> get routes => [
        _i27.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i27.RouteConfig(HomeScreenRoute.name, path: '/', children: [
          _i27.RouteConfig(HomePageRoute.name,
              path: '', parent: HomeScreenRoute.name),
          _i27.RouteConfig(BookingPageRoute.name,
              path: '', parent: HomeScreenRoute.name),
          _i27.RouteConfig(BookingListAdminRoute.name,
              path: '', parent: HomeScreenRoute.name),
          _i27.RouteConfig(NotificationPageRoute.name,
              path: '', parent: HomeScreenRoute.name),
          _i27.RouteConfig(ProfilePageRoute.name,
              path: '', parent: HomeScreenRoute.name)
        ]),
        _i27.RouteConfig(BrandPageRoute.name, path: 'brand'),
        _i27.RouteConfig(LoginPageRoute.name, path: 'login'),
        _i27.RouteConfig(RegisterFirstRoute.name, path: 'register'),
        _i27.RouteConfig(DoctorPageRoute.name, path: 'doctor'),
        _i27.RouteConfig(NearHospitalRoute.name, path: 'near_hospital'),
        _i27.RouteConfig(DoctorDetailRoute.name, path: 'doctor_detail'),
        _i27.RouteConfig(NewsDetailRoute.name, path: 'new_detail'),
        _i27.RouteConfig(BookingListDetailAdminRoute.name,
            path: 'booking_list_detial'),
        _i27.RouteConfig(ServiceWebViewRoute.name, path: 'service_webView'),
        _i27.RouteConfig(CovidDataPageRoute.name, path: 'covid_data'),
        _i27.RouteConfig(HelpCenterRoute.name, path: 'help_center'),
        _i27.RouteConfig(UserProfileInfoRoute.name, path: 'user_profile_info'),
        _i27.RouteConfig(CreateUserPageRoute.name, path: 'add_user_page'),
        _i27.RouteConfig(CreateDoctorRoute.name, path: 'add_user_page'),
        _i27.RouteConfig(BookingEndRoute.name, path: 'booking_endd_page'),
        _i27.RouteConfig(BookingListUserRoute.name, path: 'booking_user_page'),
        _i27.RouteConfig(ContactListRoute.name, path: 'contact_list'),
        _i27.RouteConfig(ChatRoomRoute.name, path: 'chast_room'),
        _i27.RouteConfig(RegisterEndRoute.name, path: 'register_end')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i27.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreenRoute extends _i27.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i27.PageRouteInfo>? children})
      : super(HomeScreenRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i3.BrandPage]
class BrandPageRoute extends _i27.PageRouteInfo<void> {
  const BrandPageRoute() : super(BrandPageRoute.name, path: 'brand');

  static const String name = 'BrandPageRoute';
}

/// generated route for
/// [_i4.LoginPage]
class LoginPageRoute extends _i27.PageRouteInfo<void> {
  const LoginPageRoute() : super(LoginPageRoute.name, path: 'login');

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i5.RegisterFirst]
class RegisterFirstRoute extends _i27.PageRouteInfo<void> {
  const RegisterFirstRoute() : super(RegisterFirstRoute.name, path: 'register');

  static const String name = 'RegisterFirstRoute';
}

/// generated route for
/// [_i6.DoctorPage]
class DoctorPageRoute extends _i27.PageRouteInfo<void> {
  const DoctorPageRoute() : super(DoctorPageRoute.name, path: 'doctor');

  static const String name = 'DoctorPageRoute';
}

/// generated route for
/// [_i7.NearHospital]
class NearHospitalRoute extends _i27.PageRouteInfo<void> {
  const NearHospitalRoute()
      : super(NearHospitalRoute.name, path: 'near_hospital');

  static const String name = 'NearHospitalRoute';
}

/// generated route for
/// [_i8.DoctorDetail]
class DoctorDetailRoute extends _i27.PageRouteInfo<DoctorDetailRouteArgs> {
  DoctorDetailRoute({_i28.Key? key, required _i29.DoctorEntity doctorEntity})
      : super(DoctorDetailRoute.name,
            path: 'doctor_detail',
            args: DoctorDetailRouteArgs(key: key, doctorEntity: doctorEntity));

  static const String name = 'DoctorDetailRoute';
}

class DoctorDetailRouteArgs {
  const DoctorDetailRouteArgs({this.key, required this.doctorEntity});

  final _i28.Key? key;

  final _i29.DoctorEntity doctorEntity;

  @override
  String toString() {
    return 'DoctorDetailRouteArgs{key: $key, doctorEntity: $doctorEntity}';
  }
}

/// generated route for
/// [_i9.NewsDetail]
class NewsDetailRoute extends _i27.PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({_i28.Key? key, required _i30.NewsEntity? item})
      : super(NewsDetailRoute.name,
            path: 'new_detail',
            args: NewsDetailRouteArgs(key: key, item: item));

  static const String name = 'NewsDetailRoute';
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({this.key, required this.item});

  final _i28.Key? key;

  final _i30.NewsEntity? item;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, item: $item}';
  }
}

/// generated route for
/// [_i10.BookingListDetailAdmin]
class BookingListDetailAdminRoute
    extends _i27.PageRouteInfo<BookingListDetailAdminRouteArgs> {
  BookingListDetailAdminRoute(
      {_i28.Key? key, required _i31.BookingListEntity bookingListEntity})
      : super(BookingListDetailAdminRoute.name,
            path: 'booking_list_detial',
            args: BookingListDetailAdminRouteArgs(
                key: key, bookingListEntity: bookingListEntity));

  static const String name = 'BookingListDetailAdminRoute';
}

class BookingListDetailAdminRouteArgs {
  const BookingListDetailAdminRouteArgs(
      {this.key, required this.bookingListEntity});

  final _i28.Key? key;

  final _i31.BookingListEntity bookingListEntity;

  @override
  String toString() {
    return 'BookingListDetailAdminRouteArgs{key: $key, bookingListEntity: $bookingListEntity}';
  }
}

/// generated route for
/// [_i11.ServiceWebView]
class ServiceWebViewRoute extends _i27.PageRouteInfo<void> {
  const ServiceWebViewRoute()
      : super(ServiceWebViewRoute.name, path: 'service_webView');

  static const String name = 'ServiceWebViewRoute';
}

/// generated route for
/// [_i12.CovidDataPage]
class CovidDataPageRoute extends _i27.PageRouteInfo<void> {
  const CovidDataPageRoute()
      : super(CovidDataPageRoute.name, path: 'covid_data');

  static const String name = 'CovidDataPageRoute';
}

/// generated route for
/// [_i13.HelpCenter]
class HelpCenterRoute extends _i27.PageRouteInfo<void> {
  const HelpCenterRoute() : super(HelpCenterRoute.name, path: 'help_center');

  static const String name = 'HelpCenterRoute';
}

/// generated route for
/// [_i14.UserProfileInfo]
class UserProfileInfoRoute
    extends _i27.PageRouteInfo<UserProfileInfoRouteArgs> {
  UserProfileInfoRoute({_i28.Key? key, required _i32.UserEntity user})
      : super(UserProfileInfoRoute.name,
            path: 'user_profile_info',
            args: UserProfileInfoRouteArgs(key: key, user: user));

  static const String name = 'UserProfileInfoRoute';
}

class UserProfileInfoRouteArgs {
  const UserProfileInfoRouteArgs({this.key, required this.user});

  final _i28.Key? key;

  final _i32.UserEntity user;

  @override
  String toString() {
    return 'UserProfileInfoRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i15.CreateUserPage]
class CreateUserPageRoute extends _i27.PageRouteInfo<void> {
  const CreateUserPageRoute()
      : super(CreateUserPageRoute.name, path: 'add_user_page');

  static const String name = 'CreateUserPageRoute';
}

/// generated route for
/// [_i16.CreateDoctor]
class CreateDoctorRoute extends _i27.PageRouteInfo<void> {
  const CreateDoctorRoute()
      : super(CreateDoctorRoute.name, path: 'add_user_page');

  static const String name = 'CreateDoctorRoute';
}

/// generated route for
/// [_i17.BookingEnd]
class BookingEndRoute extends _i27.PageRouteInfo<void> {
  const BookingEndRoute()
      : super(BookingEndRoute.name, path: 'booking_endd_page');

  static const String name = 'BookingEndRoute';
}

/// generated route for
/// [_i18.BookingListUser]
class BookingListUserRoute extends _i27.PageRouteInfo<void> {
  const BookingListUserRoute()
      : super(BookingListUserRoute.name, path: 'booking_user_page');

  static const String name = 'BookingListUserRoute';
}

/// generated route for
/// [_i19.ContactList]
class ContactListRoute extends _i27.PageRouteInfo<void> {
  const ContactListRoute() : super(ContactListRoute.name, path: 'contact_list');

  static const String name = 'ContactListRoute';
}

/// generated route for
/// [_i20.ChatRoom]
class ChatRoomRoute extends _i27.PageRouteInfo<void> {
  const ChatRoomRoute() : super(ChatRoomRoute.name, path: 'chast_room');

  static const String name = 'ChatRoomRoute';
}

/// generated route for
/// [_i21.RegisterEnd]
class RegisterEndRoute extends _i27.PageRouteInfo<void> {
  const RegisterEndRoute() : super(RegisterEndRoute.name, path: 'register_end');

  static const String name = 'RegisterEndRoute';
}

/// generated route for
/// [_i22.HomePage]
class HomePageRoute extends _i27.PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i23.BookingPage]
class BookingPageRoute extends _i27.PageRouteInfo<void> {
  const BookingPageRoute() : super(BookingPageRoute.name, path: '');

  static const String name = 'BookingPageRoute';
}

/// generated route for
/// [_i24.BookingListAdmin]
class BookingListAdminRoute extends _i27.PageRouteInfo<void> {
  const BookingListAdminRoute() : super(BookingListAdminRoute.name, path: '');

  static const String name = 'BookingListAdminRoute';
}

/// generated route for
/// [_i25.NotificationPage]
class NotificationPageRoute
    extends _i27.PageRouteInfo<NotificationPageRouteArgs> {
  NotificationPageRoute({_i28.Key? key})
      : super(NotificationPageRoute.name,
            path: '', args: NotificationPageRouteArgs(key: key));

  static const String name = 'NotificationPageRoute';
}

class NotificationPageRouteArgs {
  const NotificationPageRouteArgs({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return 'NotificationPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i26.ProfilePage]
class ProfilePageRoute extends _i27.PageRouteInfo<void> {
  const ProfilePageRoute() : super(ProfilePageRoute.name, path: '');

  static const String name = 'ProfilePageRoute';
}
