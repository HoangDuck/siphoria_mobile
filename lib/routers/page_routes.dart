import 'package:final_project_hcmute/modules/view/modules/authentication/bindings/authentication_binding.dart';
import 'package:final_project_hcmute/modules/view/modules/authentication/presentations/views/authentication_view.dart';
import 'package:final_project_hcmute/modules/view/modules/home/presentations/views/home_view.dart';
import 'package:final_project_hcmute/modules/view/modules/onboard/on_board_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../modules/view/modules/home/bindings/home_binding.dart';

class Routes{
  static const initial = Routes.home;
  static const home = '/home';
  static const loadingBoard = '/loadingBoard';
  static const authentication = '/authentication';

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
    )
  ];

}