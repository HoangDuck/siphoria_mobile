import 'package:final_project_hcmute/modules/view/modules/authentication/bindings/authentication_binding.dart';
import 'package:final_project_hcmute/modules/view/modules/authentication/presentations/views/authentication_view.dart';
import 'package:final_project_hcmute/modules/view/modules/forgot_password/presentations/views/forgot_password_view.dart';
import 'package:final_project_hcmute/modules/view/modules/history_booking/presentations/views/history_booking_view.dart';
import 'package:final_project_hcmute/modules/view/modules/home/presentations/views/home_view.dart';
import 'package:final_project_hcmute/modules/view/modules/notification_module/presentations/views/notification_view.dart';
import 'package:final_project_hcmute/modules/view/modules/onboard/on_board_view.dart';
import 'package:final_project_hcmute/modules/view/modules/profile_module/presentations/views/profile_view.dart';
import 'package:final_project_hcmute/modules/view/modules/register/binding/register_binding.dart';
import 'package:final_project_hcmute/modules/view/modules/register/presentations/views/register_view.dart';
import 'package:final_project_hcmute/modules/view/modules/room_info_module/presentations/views/room_info_view.dart';
import 'package:final_project_hcmute/modules/view/modules/search_hotel_module/bindings/search_hotel_binding.dart';
import 'package:final_project_hcmute/modules/view/modules/search_hotel_module/presentations/views/search_hotel_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../modules/view/modules/booking_details/binding/booking_detail_binding.dart';
import '../modules/view/modules/booking_details/presentations/views/booking_detail_view.dart';
import '../modules/view/modules/forgot_password/binding/forgot_password_binding.dart';
import '../modules/view/modules/history_booking/bindings/history_booking_binding.dart';
import '../modules/view/modules/home/bindings/home_binding.dart';
import '../modules/view/modules/hotel_info_module/bindings/hotel_info_binding.dart';
import '../modules/view/modules/hotel_info_module/presentations/views/hotel_info_view.dart';
import '../modules/view/modules/notification_module/bindings/notification_binding.dart';
import '../modules/view/modules/payment_module/bindings/payment_binding.dart';
import '../modules/view/modules/payment_module/presentations/views/payment_view.dart';
import '../modules/view/modules/profile_module/binding/profile_binding.dart';
import '../modules/view/modules/room_info_module/binding/room_info_binding.dart';

class Routes {
  static const initial = Routes.home;
  static const home = '/home';
  static const loadingBoard = '/loadingBoard';
  static const authentication = '/authentication';
  static const notification = '/notification';
  static const searchHotel = '/searchHotel';
  static const hotelInfo = '/hotelInfo';
  static const payment = '/payment';
  static const historyBooking = '/historyBooking';
  static const bookingDetail = '/bookingDetail';
  static const profile = '/profile';
  static const register = '/register';
  static const forgotPass = '/forgotPass';
  static const roomDetail = '/roomDetail';

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.leftToRightWithFade,
      opaque: false,
      showCupertinoParallax: true,
    ),
    GetPage(name: Routes.loadingBoard, page: () => OnBoardView()),
    GetPage(
      name: Routes.authentication,
      page: () => AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: Routes.notification,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: Routes.searchHotel,
      page: () => SearchHotelView(),
      binding: SearchHotelBinding(),
    ),
    GetPage(
      name: Routes.hotelInfo,
      page: () => HotelInfoView(),
      binding: HotelInfoBinding(),
    ),
    GetPage(
      name: Routes.payment,
      page: () => PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: Routes.historyBooking,
      page: () => HistoryBookingView(),
      binding: HistoryBookingBinding(),
    ),
    GetPage(
      name: Routes.bookingDetail,
      page: () => BookingDetailView(),
      binding: BookingDetailBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.forgotPass,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.roomDetail,
      page: () => RoomInfoView(),
      binding: RoomInfoBinding(),
    )
  ];
}
