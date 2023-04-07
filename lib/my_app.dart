import 'package:final_project_hcmute/modules/view/modules/home/presentations/controllers/home_controller.dart';
import 'package:final_project_hcmute/routers/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/logger/logger_utils.dart';
import 'modules/view/constant/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Manrope'),
      enableLog: true,
      logWriterCallback: Logger.write,
      initialRoute: Routes.initial,
      getPages: Routes.routes,
      color: colorMainBackground,
    );
  }
}
