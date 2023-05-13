import 'package:final_project_hcmute/modules/view/constant/app_images.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/models/hotel_model.dart';
import '../../../home/presentations/controllers/home_controller.dart';
import '../../domain/adapters/repository_adapter.dart';

class SearchHotelController extends GetxController{
  final ISearchHotelRepository searchHotelRepository;
  SearchHotelController({required this.searchHotelRepository});
  RxString city = ''.obs;
  RxString numberOfHotels = ''.obs;
  RxString imageCity = icHoChiMinhCity.obs;
  RxInt totalCart = 0.obs;
  RxInt totalCustomer = 0.obs;
  RxString startDate = ''.obs;
  RxString endDate = ''.obs;

  HomeController homeController = Get.find<HomeController>();

  final RxList<Hotel> listHotelData = <Hotel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    city.value = homeController.placeSearch.value;
    totalCart.value = homeController.totalNumberCartItem.value;
    totalCustomer.value = homeController.totalNumberCustomer.value;
    startDate.value = _getNameDateFormat(homeController.startDate);
    endDate.value = _getNameDateFormat(homeController.endDate);
    getListHotelMobile();
  }

  String _getNameDateFormat(DateTime? dateTime){
    dateTime ??= DateTime.now();
    String nameDayOfWeek = DateFormat('EEEE').format(dateTime);
    switch(nameDayOfWeek){
      case 'Monday':
        nameDayOfWeek = 'Th2';
        break;
      case 'Tuesday':
        nameDayOfWeek = 'Th3';
        break;
      case 'Wednesday':
        nameDayOfWeek = 'Th4';
        break;
      case 'Thursday':
        nameDayOfWeek = 'Th5';
        break;
      case 'Friday':
        nameDayOfWeek = 'Th6';
        break;
      case 'Saturday':
        nameDayOfWeek = 'Th7';
        break;
      case 'Sunday':
        nameDayOfWeek = 'CN';
        break;
    }
    return '$nameDayOfWeek, ${dateTime.day} Thg ${dateTime.month}';
  }

  getListHotelMobile() async {
    var listHotel = await searchHotelRepository.getListHotelMobile();
    listHotelData.addAll(listHotel);
    numberOfHotels.value = listHotelData.length.toString();
    listHotelData.refresh();
  }

}