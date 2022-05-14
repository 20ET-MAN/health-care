// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i24;
import 'package:flutter/material.dart' as _i25;

import '../../domain/entities/booking_entity.dart' as _i28;
import '../../domain/entities/doctor_entity.dart' as _i26;
import '../../domain/entities/news_entity.dart' as _i27;
import '../../domain/entities/user_entity.dart' as _i29;
import '../screens/booking_screen/booking_end.dart' as _i17;
import '../screens/booking_screen/booking_list%20_user.dart' as _i18;
import '../screens/booking_screen/booking_list.dart' as _i21;
import '../screens/booking_screen/booking_list_detail_admin.dart' as _i10;
import '../screens/booking_screen/booking_page.dart' as _i20;
import '../screens/brand/brand_page.dart' as _i3;
import '../screens/doctor/create_doctor.dart' as _i16;
import '../screens/doctor/doctor_detail.dart' as _i8;
import '../screens/doctor/doctor_page.dart' as _i6;
import '../screens/home/home_page.dart' as _i19;
import '../screens/home/home_screen.dart' as _i2;
import '../screens/login_screen/login_page.dart' as _i4;
import '../screens/map/near_hospital.dart' as _i7;
import '../screens/news_page/new_detail.dart' as _i9;
import '../screens/notification_screen/notification_page.dart' as _i22;
import '../screens/profile_screen/profile_page.dart' as _i23;
import '../screens/profile_screen/user_profile_info.dart' as _i14;
import '../screens/register/create_user.dart' as _i15;
import '../screens/register/register_first.dart' as _i5;
import '../screens/splash_screen.dart' as _i1;
import '../screens/web_view/covid_data_page.dart' as _i12;
import '../screens/web_view/help_center.dart' as _i13;
import '../screens/web_view/service_page.dart' as _i11;

class AppRouter extends _i24.RootStackRouter {
  AppRouter([_i25.GlobalKey<_i25.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i24.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    HomeScreenRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeScreen());
    },
    BrandPageRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.BrandPage());
    },
    LoginPageRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.LoginPage());
    },
    RegisterFirstRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.RegisterFirst());
    },
    DoctorPageRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.DoctorPage());
    },
    NearHospitalRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.NearHospital());
    },
    DoctorDetailRoute.name: (routeData) {
      final args = routeData.argsAs<DoctorDetailRouteArgs>();
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i8.DoctorDetail(key: args.key, doctorEntity: args.doctorEntity));
    },
    NewsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailRouteArgs>();
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.NewsDetail(key: args.key, item: args.item));
    },
    BookingListDetailAdminRoute.name: (routeData) {
      final args = routeData.argsAs<BookingListDetailAdminRouteArgs>();
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.BookingListDetailAdmin(
              key: args.key, bookingListEntity: args.bookingListEntity));
    },
    ServiceWebViewRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.ServiceWebView());
    },
    CovidDataPageRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.CovidDataPage());
    },
    HelpCenterRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.HelpCenter());
    },
    UserProfileInfoRoute.name: (routeData) {
      final args = routeData.argsAs<UserProfileInfoRouteArgs>();
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.UserProfileInfo(key: args.key, user: args.user));
    },
    CreateUserPageRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.CreateUserPage());
    },
    CreateDoctorRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.CreateDoctor());
    },
    BookingEndRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.BookingEnd());
    },
    BookingListUserRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.BookingListUser());
    },
    HomePageRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.HomePage());
    },
    BookingPageRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.BookingPage());
    },
    BookingListAdminRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i21.BookingListAdmin());
    },
    NotificationPageRoute.name: (routeData) {
      final args = routeData.argsAs<NotificationPageRouteArgs>(
          orElse: () => const NotificationPageRouteArgs());
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: _i22.NotificationPage(key: args.key));
    },
    ProfilePageRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i23.ProfilePage());
    }
  };

  @override
  List<_i24.RouteConfig> get routes => [
        _i24.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i24.RouteConfig(HomeScreenRoute.name, path: '/', children: [
          _i24.RouteConfig(HomePageRoute.name,
              path: '', parent: HomeScreenRoute.name),
          _i24.RouteConfig(BookingPageRoute.name,
              path: '', parent: HomeScreenRoute.name),
          _i24.RouteConfig(BookingListAdminRoute.name,
              path: '', parent: HomeScreenRoute.name),
          _i24.RouteConfig(NotificationPageRoute.name,
              path: '', parent: HomeScreenRoute.name),
          _i24.RouteConfig(ProfilePageRoute.name,
              path: '', parent: HomeScreenRoute.name)
        ]),
        _i24.RouteConfig(BrandPageRoute.name, path: 'brand'),
        _i24.RouteConfig(LoginPageRoute.name, path: 'login'),
        _i24.RouteConfig(RegisterFirstRoute.name, path: 'register'),
        _i24.RouteConfig(DoctorPageRoute.name, path: 'doctor'),
        _i24.RouteConfig(NearHospitalRoute.name, path: 'near_hospital'),
        _i24.RouteConfig(DoctorDetailRoute.name, path: 'doctor_detail'),
        _i24.RouteConfig(NewsDetailRoute.name, path: 'new_detail'),
        _i24.RouteConfig(BookingListDetailAdminRoute.name,
            path: 'booking_list_detial'),
        _i24.RouteConfig(ServiceWebViewRoute.name, path: 'service_webView'),
        _i24.RouteConfig(CovidDataPageRoute.name, path: 'covid_data'),
        _i24.RouteConfig(HelpCenterRoute.name, path: 'help_center'),
        _i24.RouteConfig(UserProfileInfoRoute.name, path: 'user_profile_info'),
        _i24.RouteConfig(CreateUserPageRoute.name, path: 'add_user_page'),
        _i24.RouteConfig(CreateDoctorRoute.name, path: 'add_user_page'),
        _i24.RouteConfig(BookingEndRoute.name, path: 'booking_endd_page'),
        _i24.RouteConfig(BookingListUserRoute.name, path: 'booking_user_page')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i24.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreenRoute extends _i24.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i24.PageRouteInfo>? children})
      : super(HomeScreenRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i3.BrandPage]
class BrandPageRoute extends _i24.PageRouteInfo<void> {
  const BrandPageRoute() : super(BrandPageRoute.name, path: 'brand');

  static const String name = 'BrandPageRoute';
}

/// generated route for
/// [_i4.LoginPage]
class LoginPageRoute extends _i24.PageRouteInfo<void> {
  const LoginPageRoute() : super(LoginPageRoute.name, path: 'login');

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i5.RegisterFirst]
class RegisterFirstRoute extends _i24.PageRouteInfo<void> {
  const RegisterFirstRoute() : super(RegisterFirstRoute.name, path: 'register');

  static const String name = 'RegisterFirstRoute';
}

/// generated route for
/// [_i6.DoctorPage]
class DoctorPageRoute extends _i24.PageRouteInfo<void> {
  const DoctorPageRoute() : super(DoctorPageRoute.name, path: 'doctor');

  static const String name = 'DoctorPageRoute';
}

/// generated route for
/// [_i7.NearHospital]
class NearHospitalRoute extends _i24.PageRouteInfo<void> {
  const NearHospitalRoute()
      : super(NearHospitalRoute.name, path: 'near_hospital');

  static const String name = 'NearHospitalRoute';
}

/// generated route for
/// [_i8.DoctorDetail]
class DoctorDetailRoute extends _i24.PageRouteInfo<DoctorDetailRouteArgs> {
  DoctorDetailRoute({_i25.Key? key, required _i26.DoctorEntity doctorEntity})
      : super(DoctorDetailRoute.name,
            path: 'doctor_detail',
            args: DoctorDetailRouteArgs(key: key, doctorEntity: doctorEntity));

  static const String name = 'DoctorDetailRoute';
}

class DoctorDetailRouteArgs {
  const DoctorDetailRouteArgs({this.key, required this.doctorEntity});

  final _i25.Key? key;

  final _i26.DoctorEntity doctorEntity;

  @override
  String toString() {
    return 'DoctorDetailRouteArgs{key: $key, doctorEntity: $doctorEntity}';
  }
}

/// generated route for
/// [_i9.NewsDetail]
class NewsDetailRoute extends _i24.PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({_i25.Key? key, required _i27.NewEntity? item})
      : super(NewsDetailRoute.name,
            path: 'new_detail',
            args: NewsDetailRouteArgs(key: key, item: item));

  static const String name = 'NewsDetailRoute';
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({this.key, required this.item});

  final _i25.Key? key;

  final _i27.NewEntity? item;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, item: $item}';
  }
}

/// generated route for
/// [_i10.BookingListDetailAdmin]
class BookingListDetailAdminRoute
    extends _i24.PageRouteInfo<BookingListDetailAdminRouteArgs> {
  BookingListDetailAdminRoute(
      {_i25.Key? key, required _i28.BookingListEntity bookingListEntity})
      : super(BookingListDetailAdminRoute.name,
            path: 'booking_list_detial',
            args: BookingListDetailAdminRouteArgs(
                key: key, bookingListEntity: bookingListEntity));

  static const String name = 'BookingListDetailAdminRoute';
}

class BookingListDetailAdminRouteArgs {
  const BookingListDetailAdminRouteArgs(
      {this.key, required this.bookingListEntity});

  final _i25.Key? key;

  final _i28.BookingListEntity bookingListEntity;

  @override
  String toString() {
    return 'BookingListDetailAdminRouteArgs{key: $key, bookingListEntity: $bookingListEntity}';
  }
}

/// generated route for
/// [_i11.ServiceWebView]
class ServiceWebViewRoute extends _i24.PageRouteInfo<void> {
  const ServiceWebViewRoute()
      : super(ServiceWebViewRoute.name, path: 'service_webView');

  static const String name = 'ServiceWebViewRoute';
}

/// generated route for
/// [_i12.CovidDataPage]
class CovidDataPageRoute extends _i24.PageRouteInfo<void> {
  const CovidDataPageRoute()
      : super(CovidDataPageRoute.name, path: 'covid_data');

  static const String name = 'CovidDataPageRoute';
}

/// generated route for
/// [_i13.HelpCenter]
class HelpCenterRoute extends _i24.PageRouteInfo<void> {
  const HelpCenterRoute() : super(HelpCenterRoute.name, path: 'help_center');

  static const String name = 'HelpCenterRoute';
}

/// generated route for
/// [_i14.UserProfileInfo]
class UserProfileInfoRoute
    extends _i24.PageRouteInfo<UserProfileInfoRouteArgs> {
  UserProfileInfoRoute({_i25.Key? key, required _i29.UserEntity user})
      : super(UserProfileInfoRoute.name,
            path: 'user_profile_info',
            args: UserProfileInfoRouteArgs(key: key, user: user));

  static const String name = 'UserProfileInfoRoute';
}

class UserProfileInfoRouteArgs {
  const UserProfileInfoRouteArgs({this.key, required this.user});

  final _i25.Key? key;

  final _i29.UserEntity user;

  @override
  String toString() {
    return 'UserProfileInfoRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i15.CreateUserPage]
class CreateUserPageRoute extends _i24.PageRouteInfo<void> {
  const CreateUserPageRoute()
      : super(CreateUserPageRoute.name, path: 'add_user_page');

  static const String name = 'CreateUserPageRoute';
}

/// generated route for
/// [_i16.CreateDoctor]
class CreateDoctorRoute extends _i24.PageRouteInfo<void> {
  const CreateDoctorRoute()
      : super(CreateDoctorRoute.name, path: 'add_user_page');

  static const String name = 'CreateDoctorRoute';
}

/// generated route for
/// [_i17.BookingEnd]
class BookingEndRoute extends _i24.PageRouteInfo<void> {
  const BookingEndRoute()
      : super(BookingEndRoute.name, path: 'booking_endd_page');

  static const String name = 'BookingEndRoute';
}

/// generated route for
/// [_i18.BookingListUser]
class BookingListUserRoute extends _i24.PageRouteInfo<void> {
  const BookingListUserRoute()
      : super(BookingListUserRoute.name, path: 'booking_user_page');

  static const String name = 'BookingListUserRoute';
}

/// generated route for
/// [_i19.HomePage]
class HomePageRoute extends _i24.PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i20.BookingPage]
class BookingPageRoute extends _i24.PageRouteInfo<void> {
  const BookingPageRoute() : super(BookingPageRoute.name, path: '');

  static const String name = 'BookingPageRoute';
}

/// generated route for
/// [_i21.BookingListAdmin]
class BookingListAdminRoute extends _i24.PageRouteInfo<void> {
  const BookingListAdminRoute() : super(BookingListAdminRoute.name, path: '');

  static const String name = 'BookingListAdminRoute';
}

/// generated route for
/// [_i22.NotificationPage]
class NotificationPageRoute
    extends _i24.PageRouteInfo<NotificationPageRouteArgs> {
  NotificationPageRoute({_i25.Key? key})
      : super(NotificationPageRoute.name,
            path: '', args: NotificationPageRouteArgs(key: key));

  static const String name = 'NotificationPageRoute';
}

class NotificationPageRouteArgs {
  const NotificationPageRouteArgs({this.key});

  final _i25.Key? key;

  @override
  String toString() {
    return 'NotificationPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i23.ProfilePage]
class ProfilePageRoute extends _i24.PageRouteInfo<void> {
  const ProfilePageRoute() : super(ProfilePageRoute.name, path: '');

  static const String name = 'ProfilePageRoute';
}
