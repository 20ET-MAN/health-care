// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i20;
import 'package:flutter/material.dart' as _i21;

import '../../domain/entities/booking_list.dart' as _i24;
import '../../domain/entities/doctor.dart' as _i22;
import '../../domain/entities/new_entity.dart' as _i23;
import '../screens/booking_screen/booking_list.dart' as _i16;
import '../screens/booking_screen/booking_list_detail_admin.dart' as _i10;
import '../screens/booking_screen/booking_page.dart' as _i15;
import '../screens/brand/brand_page.dart' as _i3;
import '../screens/doctor/doctor_detail.dart' as _i8;
import '../screens/doctor/doctor_page.dart' as _i6;
import '../screens/home/home_page.dart' as _i14;
import '../screens/home/home_screen.dart' as _i2;
import '../screens/login_screen/login_page.dart' as _i4;
import '../screens/map/near_hospital.dart' as _i7;
import '../screens/news_page/new_detail.dart' as _i9;
import '../screens/notification_admin/notification_admin_page.dart' as _i17;
import '../screens/notification_screen/notification_page.dart' as _i18;
import '../screens/profile_screen/profile_page.dart' as _i19;
import '../screens/register/register_first.dart' as _i5;
import '../screens/splash_screen.dart' as _i1;
import '../screens/web_view/covid_data_page.dart' as _i12;
import '../screens/web_view/help_center.dart' as _i13;
import '../screens/web_view/service_page.dart' as _i11;

class AppRouter extends _i20.RootStackRouter {
  AppRouter([_i21.GlobalKey<_i21.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i20.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    HomeScreenRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeScreen());
    },
    BrandPageRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.BrandPage());
    },
    LoginPageRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.LoginPage());
    },
    RegisterFirstRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterFirstRouteArgs>(
          orElse: () => const RegisterFirstRouteArgs());
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.RegisterFirst(key: args.key));
    },
    DoctorPageRoute.name: (routeData) {
      final args = routeData.argsAs<DoctorPageRouteArgs>(
          orElse: () => const DoctorPageRouteArgs());
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.DoctorPage(key: args.key));
    },
    NearHospitalRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.NearHospital());
    },
    DoctorDetailRoute.name: (routeData) {
      final args = routeData.argsAs<DoctorDetailRouteArgs>();
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i8.DoctorDetail(key: args.key, doctorEntity: args.doctorEntity));
    },
    NewsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailRouteArgs>();
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.NewsDetail(key: args.key, item: args.item));
    },
    BookingListDetailAdminRoute.name: (routeData) {
      final args = routeData.argsAs<BookingListDetailAdminRouteArgs>();
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.BookingListDetailAdmin(
              key: args.key,
              bookingListEntity: args.bookingListEntity,
              updateStatus: args.updateStatus));
    },
    ServiceWebViewRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.ServiceWebView());
    },
    CovidDataPageRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.CovidDataPage());
    },
    HelpCenterRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.HelpCenter());
    },
    HomePageRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.HomePage());
    },
    BookingPageRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.BookingPage());
    },
    BookingListAdminRoute.name: (routeData) {
      final args = routeData.argsAs<BookingListAdminRouteArgs>(
          orElse: () => const BookingListAdminRouteArgs());
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: _i16.BookingListAdmin(key: args.key));
    },
    NotificationPageAdminRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.NotificationPageAdmin());
    },
    NotificationPageRoute.name: (routeData) {
      final args = routeData.argsAs<NotificationPageRouteArgs>(
          orElse: () => const NotificationPageRouteArgs());
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: _i18.NotificationPage(key: args.key));
    },
    ProfilePageRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.ProfilePage());
    }
  };

  @override
  List<_i20.RouteConfig> get routes => [
        _i20.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i20.RouteConfig(HomeScreenRoute.name, path: '/', children: [
          _i20.RouteConfig(HomePageRoute.name,
              path: '', parent: HomeScreenRoute.name),
          _i20.RouteConfig(BookingPageRoute.name,
              path: '', parent: HomeScreenRoute.name),
          _i20.RouteConfig(BookingListAdminRoute.name,
              path: '', parent: HomeScreenRoute.name),
          _i20.RouteConfig(NotificationPageAdminRoute.name,
              path: '', parent: HomeScreenRoute.name),
          _i20.RouteConfig(NotificationPageRoute.name,
              path: '', parent: HomeScreenRoute.name),
          _i20.RouteConfig(ProfilePageRoute.name,
              path: '', parent: HomeScreenRoute.name)
        ]),
        _i20.RouteConfig(BrandPageRoute.name, path: 'brand'),
        _i20.RouteConfig(LoginPageRoute.name, path: 'login'),
        _i20.RouteConfig(RegisterFirstRoute.name, path: 'register'),
        _i20.RouteConfig(DoctorPageRoute.name, path: 'doctor'),
        _i20.RouteConfig(NearHospitalRoute.name, path: 'near_hospital'),
        _i20.RouteConfig(DoctorDetailRoute.name, path: 'doctor_detail'),
        _i20.RouteConfig(NewsDetailRoute.name, path: 'new_detail'),
        _i20.RouteConfig(BookingListDetailAdminRoute.name,
            path: 'booking_list_detial'),
        _i20.RouteConfig(ServiceWebViewRoute.name, path: 'service_webView'),
        _i20.RouteConfig(CovidDataPageRoute.name, path: 'service_webView'),
        _i20.RouteConfig(HelpCenterRoute.name, path: 'service_webView')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i20.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreenRoute extends _i20.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i20.PageRouteInfo>? children})
      : super(HomeScreenRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i3.BrandPage]
class BrandPageRoute extends _i20.PageRouteInfo<void> {
  const BrandPageRoute() : super(BrandPageRoute.name, path: 'brand');

  static const String name = 'BrandPageRoute';
}

/// generated route for
/// [_i4.LoginPage]
class LoginPageRoute extends _i20.PageRouteInfo<void> {
  const LoginPageRoute() : super(LoginPageRoute.name, path: 'login');

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i5.RegisterFirst]
class RegisterFirstRoute extends _i20.PageRouteInfo<RegisterFirstRouteArgs> {
  RegisterFirstRoute({_i21.Key? key})
      : super(RegisterFirstRoute.name,
            path: 'register', args: RegisterFirstRouteArgs(key: key));

  static const String name = 'RegisterFirstRoute';
}

class RegisterFirstRouteArgs {
  const RegisterFirstRouteArgs({this.key});

  final _i21.Key? key;

  @override
  String toString() {
    return 'RegisterFirstRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.DoctorPage]
class DoctorPageRoute extends _i20.PageRouteInfo<DoctorPageRouteArgs> {
  DoctorPageRoute({_i21.Key? key})
      : super(DoctorPageRoute.name,
            path: 'doctor', args: DoctorPageRouteArgs(key: key));

  static const String name = 'DoctorPageRoute';
}

class DoctorPageRouteArgs {
  const DoctorPageRouteArgs({this.key});

  final _i21.Key? key;

  @override
  String toString() {
    return 'DoctorPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.NearHospital]
class NearHospitalRoute extends _i20.PageRouteInfo<void> {
  const NearHospitalRoute()
      : super(NearHospitalRoute.name, path: 'near_hospital');

  static const String name = 'NearHospitalRoute';
}

/// generated route for
/// [_i8.DoctorDetail]
class DoctorDetailRoute extends _i20.PageRouteInfo<DoctorDetailRouteArgs> {
  DoctorDetailRoute({_i21.Key? key, required _i22.DoctorEntity doctorEntity})
      : super(DoctorDetailRoute.name,
            path: 'doctor_detail',
            args: DoctorDetailRouteArgs(key: key, doctorEntity: doctorEntity));

  static const String name = 'DoctorDetailRoute';
}

class DoctorDetailRouteArgs {
  const DoctorDetailRouteArgs({this.key, required this.doctorEntity});

  final _i21.Key? key;

  final _i22.DoctorEntity doctorEntity;

  @override
  String toString() {
    return 'DoctorDetailRouteArgs{key: $key, doctorEntity: $doctorEntity}';
  }
}

/// generated route for
/// [_i9.NewsDetail]
class NewsDetailRoute extends _i20.PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({_i21.Key? key, required _i23.NewEntity item})
      : super(NewsDetailRoute.name,
            path: 'new_detail',
            args: NewsDetailRouteArgs(key: key, item: item));

  static const String name = 'NewsDetailRoute';
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({this.key, required this.item});

  final _i21.Key? key;

  final _i23.NewEntity item;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, item: $item}';
  }
}

/// generated route for
/// [_i10.BookingListDetailAdmin]
class BookingListDetailAdminRoute
    extends _i20.PageRouteInfo<BookingListDetailAdminRouteArgs> {
  BookingListDetailAdminRoute(
      {_i21.Key? key,
      required _i24.BookingListEntity bookingListEntity,
      required void Function() updateStatus})
      : super(BookingListDetailAdminRoute.name,
            path: 'booking_list_detial',
            args: BookingListDetailAdminRouteArgs(
                key: key,
                bookingListEntity: bookingListEntity,
                updateStatus: updateStatus));

  static const String name = 'BookingListDetailAdminRoute';
}

class BookingListDetailAdminRouteArgs {
  const BookingListDetailAdminRouteArgs(
      {this.key, required this.bookingListEntity, required this.updateStatus});

  final _i21.Key? key;

  final _i24.BookingListEntity bookingListEntity;

  final void Function() updateStatus;

  @override
  String toString() {
    return 'BookingListDetailAdminRouteArgs{key: $key, bookingListEntity: $bookingListEntity, updateStatus: $updateStatus}';
  }
}

/// generated route for
/// [_i11.ServiceWebView]
class ServiceWebViewRoute extends _i20.PageRouteInfo<void> {
  const ServiceWebViewRoute()
      : super(ServiceWebViewRoute.name, path: 'service_webView');

  static const String name = 'ServiceWebViewRoute';
}

/// generated route for
/// [_i12.CovidDataPage]
class CovidDataPageRoute extends _i20.PageRouteInfo<void> {
  const CovidDataPageRoute()
      : super(CovidDataPageRoute.name, path: 'service_webView');

  static const String name = 'CovidDataPageRoute';
}

/// generated route for
/// [_i13.HelpCenter]
class HelpCenterRoute extends _i20.PageRouteInfo<void> {
  const HelpCenterRoute()
      : super(HelpCenterRoute.name, path: 'service_webView');

  static const String name = 'HelpCenterRoute';
}

/// generated route for
/// [_i14.HomePage]
class HomePageRoute extends _i20.PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i15.BookingPage]
class BookingPageRoute extends _i20.PageRouteInfo<void> {
  const BookingPageRoute() : super(BookingPageRoute.name, path: '');

  static const String name = 'BookingPageRoute';
}

/// generated route for
/// [_i16.BookingListAdmin]
class BookingListAdminRoute
    extends _i20.PageRouteInfo<BookingListAdminRouteArgs> {
  BookingListAdminRoute({_i21.Key? key})
      : super(BookingListAdminRoute.name,
            path: '', args: BookingListAdminRouteArgs(key: key));

  static const String name = 'BookingListAdminRoute';
}

class BookingListAdminRouteArgs {
  const BookingListAdminRouteArgs({this.key});

  final _i21.Key? key;

  @override
  String toString() {
    return 'BookingListAdminRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i17.NotificationPageAdmin]
class NotificationPageAdminRoute extends _i20.PageRouteInfo<void> {
  const NotificationPageAdminRoute()
      : super(NotificationPageAdminRoute.name, path: '');

  static const String name = 'NotificationPageAdminRoute';
}

/// generated route for
/// [_i18.NotificationPage]
class NotificationPageRoute
    extends _i20.PageRouteInfo<NotificationPageRouteArgs> {
  NotificationPageRoute({_i21.Key? key})
      : super(NotificationPageRoute.name,
            path: '', args: NotificationPageRouteArgs(key: key));

  static const String name = 'NotificationPageRoute';
}

class NotificationPageRouteArgs {
  const NotificationPageRouteArgs({this.key});

  final _i21.Key? key;

  @override
  String toString() {
    return 'NotificationPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i19.ProfilePage]
class ProfilePageRoute extends _i20.PageRouteInfo<void> {
  const ProfilePageRoute() : super(ProfilePageRoute.name, path: '');

  static const String name = 'ProfilePageRoute';
}
