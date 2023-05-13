import 'package:get/get.dart';

import '../../../../../../core/models/hotel_details_model.dart';

class RoomInfoController extends GetxController{
  late RoomType data;

  @override
  void onInit() {
    super.onInit;
    data = Get.arguments;
  }
}