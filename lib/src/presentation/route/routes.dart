import 'package:auto_route/annotations.dart';
import 'package:healthcare/src/presentation/screens/booking_screen/booking_list.dart';
import 'package:healthcare/src/presentation/screens/booking_screen/booking_page.dart';
import 'package:healthcare/src/presentation/screens/brand/brand_page.dart';
import 'package:healthcare/src/presentation/screens/doctor/doctor_page.dart';
import 'package:healthcare/src/presentation/screens/home/home_page.dart';
import 'package:healthcare/src/presentation/screens/home/home_screen.dart';
import 'package:healthcare/src/presentation/screens/login_screen/login_page.dart';
import 'package:healthcare/src/presentation/screens/map/near_hospital.dart';
import 'package:healthcare/src/presentation/screens/news_page/new_detail.dart';
import 'package:healthcare/src/presentation/screens/notification_admin/notification_admin_page.dart';
import 'package:healthcare/src/presentation/screens/notification_screen/notification_page.dart';
import 'package:healthcare/src/presentation/screens/profile_screen/profile_page.dart';
import 'package:healthcare/src/presentation/screens/profile_screen/user_profile_info.dart';
import 'package:healthcare/src/presentation/screens/register/register_first.dart';
import 'package:healthcare/src/presentation/screens/splash_screen.dart';
import 'package:healthcare/src/presentation/screens/web_view/service_page.dart';

import '../screens/booking_screen/booking_list_detail_admin.dart';
import '../screens/doctor/doctor_detail.dart';
import '../screens/web_view/covid_data_page.dart';
import '../screens/web_view/help_center.dart';

@MaterialAutoRouter(
  //replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: SplashScreen,
    ),
    AutoRoute(
      path: '/',
      page: HomeScreen,
      children: [
        AutoRoute(
          path: '',
          page: HomePage,
        ),
        AutoRoute(
          path: '',
          page: BookingPage,
        ),
        AutoRoute(
          path: '',
          page: BookingListAdmin,
        ),
        AutoRoute(
          path: '',
          page: NotificationPageAdmin,
        ),
        AutoRoute(
          path: '',
          page: NotificationPage,
        ),
        AutoRoute(
          path: '',
          page: ProfilePage,
        ),
      ],
    ),
    AutoRoute(
      path: 'brand',
      page: BrandPage,
    ),
    AutoRoute(
      path: 'login',
      page: LoginPage,
    ),
    AutoRoute(
      path: 'register',
      page: RegisterFirst,
    ),
    AutoRoute(
      path: 'doctor',
      page: DoctorPage,
    ),
    AutoRoute(
      path: 'near_hospital',
      page: NearHospital,
    ),
    AutoRoute(
      path: 'doctor_detail',
      page: DoctorDetail,
    ),
    AutoRoute(
      path: 'new_detail',
      page: NewsDetail,
    ),
    AutoRoute(
      path: 'booking_list_detial',
      page: BookingListDetailAdmin,
    ),
    AutoRoute(
      path: 'service_webView',
      page: ServiceWebView,
    ),
    AutoRoute(
      path: 'service_webView',
      page: CovidDataPage,
    ),
    AutoRoute(
      path: 'service_webView',
      page: HelpCenter,
    ),
    AutoRoute(
      path: 'service_webView',
      page: UserProfileInfo,
    ),
  ],
)
class $AppRouter {}
