
import 'package:final_project_hcmute/core/services/local_storage.dart';
import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/province_model.dart';
import 'package:final_project_hcmute/modules/widget/custom_dialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../../../routers/page_routes.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_images.dart';
import '../../domain/adapters/repository_adapter.dart';
import '../../domain/entities/cart_item_model.dart';

class HomeController extends GetxController{
  final IHomeRepository homeRepository;

  HomeController({required this.homeRepository});

  TextEditingController locationEditController=TextEditingController();
  RxBool isLocationEditEmpty = false.obs;
  RxInt onSelectedTabIndex=0.obs;
  RxList<ProvinceModel> listProvinces=<ProvinceModel>[].obs;
  List<String> listNameCity = [];
  Rx<PageController> pageController = PageController(initialPage: 0).obs;
  RxInt totalNumberCartItem= 0.obs;
  RxList<CartModel> listCart = <CartModel>[].obs;
  RxList<String> listResort=<String>[].obs;
  RxList<String> listHotelCart = <String>[].obs;

  String accessToken = '';
  String refreshToken = '';

  DateTime? startDate;
  DateTime? endDate;
  RxBool isDateRangeEditEmpty = false.obs;
  RxString fullName="Tài khoản".obs;
  RxString avatar=icHoChiMinhCity.obs;
  RxString rank='Đồng'.obs;
  RxString placeSearch = ''.obs;

  RxInt totalNumberRoom= 1.obs;
  RxInt totalNumberCustomer= 1.obs;
  RxInt totalNumberCustomerChildren = 0.obs;
  RxDouble totalCostCart = 0.0.obs;

  selectedPageIndex(int index){

    if(index!=0 && accessToken.isEmpty){
      Get.toNamed(Routes.authentication);
    }else{
      if(index == 3) {
        getUserProfileData();
      }else if(index==1){
        _getListCartItem();
      }
      onSelectedTabIndex.value = index;
      pageController.value.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  _getToken()async {
    SecureStorage secureStorage=SecureStorage();
    try{
      accessToken = (await secureStorage.accessToken)!;
      refreshToken = (await secureStorage.refreshToken)!;
    }catch(e){
      debugPrint(e.toString());
    }
  }

  deleteCartItem(String idCart) async {
    try{
      var result = await homeRepository.deleteCartItem(idCart);
      if(result){
        totalNumberCartItem.value--;
        listCart.removeWhere((element) => element.id == idCart);
        for(var element in listCart){
          totalCostCart.value -= element.totalPrice;
        }
        listCart.refresh();
        Get.snackbar(
          "Giỏ hàng", "Xoá khỏi giỏ hàng thành công",
          icon: const Icon(Icons.person, color: Colors.white),
          backgroundColor: colorPriceRoom,
          snackPosition: SnackPosition.TOP,
        );
      }else{
        Get.snackbar(
          "Giỏ hàng", "Xoá khỏi giỏ hàng thất bại",
          icon: const Icon(Icons.person, color: Colors.white),
          backgroundColor: colorRatingStar,
          snackPosition: SnackPosition.TOP,
        );
      }
    }catch(e){
      SecureStorage secureStorage = SecureStorage();
      secureStorage.deleteAccessToken();
      secureStorage.deleteRefreshToken();
      Get.toNamed(Routes.authentication);
    }
  }

  calculateTotalCostPerHotel(List<CartModel> listCart){
    var totalCost = 0;
    for(var element in listCart){
      totalCost += element.totalPrice;
    }
    return totalCost;
  }

  _getListCartItem() async {
    listCart.clear();
    try{
      var listCartModel = await homeRepository.getListCartItem();
      if(listCartModel.isNotEmpty){
        for(var element in listCartModel){
          totalCostCart.value += element.totalPrice;
        }
        listCart.addAll(listCartModel);
        totalNumberCartItem.value = listCart.length;
        listCart.refresh();
        for (var element in listCart) {
          listHotelCart.add('${element.hotel.id}#${element.hotel.name}');
        }
        var tempNewHotelList = listHotelCart.toSet().toList();
        listHotelCart.clear();
        listHotelCart.addAll(tempNewHotelList);
        listHotelCart.refresh();
        totalNumberCartItem.refresh();
      }
    }catch(e){
      SecureStorage secureStorage = SecureStorage();
      secureStorage.deleteAccessToken();
      secureStorage.deleteRefreshToken();
    }
  }

  _getAPIDataTest() async {
    var tempProvinces = await homeRepository.getProvince('',0);
    List<ProvinceModel> tempListFavoriteProvince = [];
    if(tempProvinces.isNotEmpty){
      listProvinces.addAll(tempProvinces);
      for(int index=0;index<tempProvinces.length;index++){
        listNameCity.add(listProvinces[index].name);
        if(',1,79,48,92,56,'.contains(',${listProvinces[index].code.toString()},')){
          tempListFavoriteProvince.add(listProvinces[index]);
        }
      }
      listProvinces.clear();
      listProvinces.addAll(tempListFavoriteProvince);
      listProvinces.refresh();
    }

  }

  initListResort(){
    listResort.addAll(["Khách sạn","Khu nghỉ dưỡng", "Villa","Nhà nghỉ"]);
    listResort.refresh();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    _getToken();
    _checkNavigateToCart();
    initFirebaseMessage();
    initListResort();
    await _getAPIDataTest();
    await _getListCartItem();
  }


  @override
  void onClose() {
    pageController.close();
  }

  _checkNavigateToCart(){
    var isNavigateToCart = Get.arguments;
    if(isNavigateToCart!=null && isNavigateToCart){
      selectedPageIndex(1);
    }
  }

  getUserProfileData() async {
    try{
      var userProfile = await homeRepository.getUserProfile();
      if (userProfile.id != '') {
        fullName.value = userProfile.fullName;
        avatar.value = userProfile.avatar;
        refresh();
      }
    } catch (e){
      SecureStorage secureStorage = SecureStorage();
      secureStorage.deleteAccessToken();
      secureStorage.deleteRefreshToken();
      Get.toNamed(Routes.authentication);
    }
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

  validateSearch(){
    isLocationEditEmpty.value = /*locationEditController.text.isEmpty && */placeSearch.isEmpty;
    isDateRangeEditEmpty.value = startDate == null || endDate == null;
  }

  addPaymentFromCart() async{
    showLoadingDialog(Get.context!);
    try{
      var result = await homeRepository.addToPayment();
      Get.back();
      if(result){
        totalNumberCartItem.value = 0;
        Get.snackbar(
          "Siphoria", "Thêm giao dịch thành công",
          icon: const Icon(Icons.person, color: Colors.white),
          backgroundColor: colorPriceRoom,
          snackPosition: SnackPosition.TOP,
        );
        Get.toNamed(Routes.payment);
      }else{
        Get.snackbar(
          "Siphoria", "Thêm giao dịch  thất bại",
          icon: const Icon(Icons.person, color: Colors.white),
          backgroundColor: colorRatingStar,
          snackPosition: SnackPosition.TOP,
        );
      }
    }catch(e){
      Get.back();
      SecureStorage secureStorage = SecureStorage();
      secureStorage.deleteAccessToken();
      secureStorage.deleteRefreshToken();
      Get.toNamed(Routes.authentication);
    }
  }

  @override
  void onReady() {
    super.onReady();
    print("Ready");
  }
}