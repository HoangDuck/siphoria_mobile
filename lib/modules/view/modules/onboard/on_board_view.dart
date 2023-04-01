import 'package:final_project_hcmute/modules/view/modules/home/presentations/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routers/page_routes.dart';
import '../home/bindings/home_binding.dart';

class OnBoardView extends GetView{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: const Center(
        child: Text("hello"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.toNamed(Routes.home);
        },
      ),
    );
  }
  
}