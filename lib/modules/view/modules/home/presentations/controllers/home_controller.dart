
import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/province_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../domain/adapters/repository_adapter.dart';

class HomeController extends GetxController{
  final IHomeRepository homeRepository;

  HomeController({required this.homeRepository});

  TextEditingController locationEditController=TextEditingController();
  RxInt onSelectedTabIndex=0.obs;
  RxList<ProvinceModel> listProvinces=<ProvinceModel>[].obs;
  Rx<PageController> pageController = PageController(initialPage: 0).obs;

  selectedPageIndex(int index){
    onSelectedTabIndex.value = index;
    pageController.value.animateToPage(index,duration:const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  _getAPIDataTest() async {
    var tempProvinces = await homeRepository.getProvince('',0);
    if(tempProvinces.isNotEmpty){
      listProvinces.addAll(tempProvinces);
      listProvinces.refresh();
    }

  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await _getAPIDataTest();
  }

  @override
  void onReady() {
    super.onReady();
    print("Ready");
  }
}