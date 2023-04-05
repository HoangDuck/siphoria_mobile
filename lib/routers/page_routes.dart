import 'package:final_project_hcmute/modules/view/modules/authentication/bindings/authentication_binding.dart';
import 'package:final_project_hcmute/modules/view/modules/authentication/presentations/views/authentication_view.dart';
import 'package:final_project_hcmute/modules/view/modules/home/presentations/views/home_view.dart';
import 'package:final_project_hcmute/modules/view/modules/notification_module/presentations/views/notification_view.dart';
import 'package:final_project_hcmute/modules/view/modules/onboard/on_board_view.dart';
import 'package:final_project_hcmute/modules/view/modules/search_hotel_module/bindings/search_hotel_binding.dart';
import 'package:final_project_hcmute/modules/view/modules/search_hotel_module/presentations/views/search_hotel_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../modules/view/modules/home/bindings/home_binding.dart';
import '../modules/view/modules/hotel_info_module/bindings/hotel_info_binding.dart';
import '../modules/view/modules/hotel_info_module/presentations/views/hotel_info_view.dart';
import '../modules/view/modules/notification_module/bindings/notification_binding.dart';

class Routes {
  static const initial = Routes.home;
  static const home = '/home';
  static const loadingBoard = '/loadingBoard';
  static const authentication = '/authentication';
  static const notification = '/notification';
  static const searchHotel = '/searchHotel';
  static const hotelInfo = '/hotelInfo';

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
    )
  ];
}
