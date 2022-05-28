import 'package:auto_route/annotations.dart';
import 'package:healthcare/src/presentation/screens/booking_screen/booking_end.dart';
import 'package:healthcare/src/presentation/screens/booking_screen/booking_list.dart';
import 'package:healthcare/src/presentation/screens/booking_screen/booking_page.dart';
import 'package:healthcare/src/presentation/screens/brand/brand_page.dart';
import 'package:healthcare/src/presentation/screens/doctor/create_doctor.dart';
import 'package:healthcare/src/presentation/screens/doctor/doctor_page.dart';
import 'package:healthcare/src/presentation/screens/home/home_page.dart';
import 'package:healthcare/src/presentation/screens/home/home_screen.dart';
import 'package:healthcare/src/presentation/screens/login_screen/login_page.dart';
import 'package:healthcare/src/presentation/screens/map/near_hospital.dart';
import 'package:healthcare/src/presentation/screens/message/chat_room.dart';
import 'package:healthcare/src/presentation/screens/message/contact_list.dart';
import 'package:healthcare/src/presentation/screens/news_page/new_detail.dart';
import 'package:healthcare/src/presentation/screens/notification_screen/notification_page.dart';
import 'package:healthcare/src/presentation/screens/profile_screen/profile_page.dart';
import 'package:healthcare/src/presentation/screens/profile_screen/user_profile_info.dart';
import 'package:healthcare/src/presentation/screens/register/create_user.dart';
import 'package:healthcare/src/presentation/screens/register/register_first.dart';
import 'package:healthcare/src/presentation/screens/splash_screen.dart';
import 'package:healthcare/src/presentation/widget/service_page.dart';

import '../screens/booking_screen/booking_list _user.dart';
import '../screens/booking_screen/booking_list_detail_admin.dart';
import '../screens/doctor/doctor_detail.dart';
import '../screens/register/register_end.dart';
import '../screens/web_view/covid_data_page.dart';
import '../widget/help_center.dart';

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
      path: 'covid_data',
      page: CovidDataPage,
    ),
    AutoRoute(
      path: 'help_center',
      page: HelpCenter,
    ),
    AutoRoute(
      path: 'user_profile_info',
      page: UserProfileInfo,
    ),
    AutoRoute(
      path: 'add_user_page',
      page: CreateUserPage,
    ),
    AutoRoute(
      path: 'add_user_page',
      page: CreateDoctor,
    ),
    AutoRoute(
      path: 'booking_endd_page',
      page: BookingEnd,
    ),
    AutoRoute(
      path: 'booking_user_page',
      page: BookingListUser,
    ),
    AutoRoute(
      path: 'contact_list',
      page: ContactList,
    ),
    AutoRoute(
      path: 'chast_room',
      page: ChatRoom,
    ),
    AutoRoute(
      path: 'register_end',
      page: RegisterEnd,
    ),
  ],
)
class $AppRouter {}
