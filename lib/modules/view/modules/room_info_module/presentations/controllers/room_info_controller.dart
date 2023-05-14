import 'package:get/get.dart';

import '../../../../../../core/models/hotel_details_model.dart';

class RoomInfoController extends GetxController{
  late RoomType data;

  RxString previewImage = ''.obs;

  @override
  void onInit() {
    super.onInit;
    data = Get.arguments;
    previewImage.value = data.photos.split(";").first;
  }
}