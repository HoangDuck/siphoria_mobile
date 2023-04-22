
import 'package:final_project_hcmute/core/services/local_storage.dart';
import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/province_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../../../routers/page_routes.dart';
import '../../domain/adapters/repository_adapter.dart';
import '../../domain/entities/cart_item_model.dart';

class HomeController extends GetxController{
  final IHomeRepository homeRepository;

  HomeController({required this.homeRepository});

  TextEditingController locationEditController=TextEditingController();
  RxInt onSelectedTabIndex=0.obs;
  RxList<ProvinceModel> listProvinces=<ProvinceModel>[].obs;
  Rx<PageController> pageController = PageController(initialPage: 0).obs;
  RxInt totalNumberCartItem= 0.obs;
  RxList<CartModel> listCart = <CartModel>[].obs;
  RxList<String> listResort=<String>[].obs;

  String accessToken = '';
  String refreshToken = '';

  selectedPageIndex(int index){
    if(index==3 && accessToken.isEmpty){
      Get.toNamed(Routes.authentication);
    }else{
      onSelectedTabIndex.value = index;
      pageController.value.animateToPage(index,duration:const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  _getToken()async {
    SecureStorage secureStorage=SecureStorage();
    accessToken = (await secureStorage.accessToken)!;
    refreshToken = (await secureStorage.refreshToken)!;
  }

  _getAPIDataTest() async {
    var tempProvinces = await homeRepository.getProvince('',0);
    if(tempProvinces.isNotEmpty){
      listProvinces.addAll(tempProvinces);
      listProvinces.refresh();
    }

  }

  initListResort(){
    listResort.addAll(["Resort","Khu nghỉ dưỡng", "Villa"]);
    listResort.refresh();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    _getToken();
    initFirebaseMessage();
    initListResort();
    await _getAPIDataTest();
  }

  initFirebaseMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      Get.snackbar(
        "GeeksforGeeks",
        "Hello everyone",
        icon: const Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
      );
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      Get.snackbar(
        "GeeksforGeeks",
        "Hello everyone",
        icon: const Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
      );
    });
  }

  @override
  void onReady() {
    super.onReady();
    print("Ready");
  }
}