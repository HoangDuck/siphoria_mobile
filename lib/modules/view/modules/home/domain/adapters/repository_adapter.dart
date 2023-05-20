
// ignore: one_member_abstracts
import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/country_model.dart';
import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/hotel_category_model.dart';
import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/hotel_model.dart';

import '../../../payment_module/domain/entities/payment_model.dart';
import '../../../profile_module/domain/entities/user_profile_model.dart';
import '../entities/cart_item_model.dart';
import '../entities/province_model.dart';

abstract class IHomeRepository {
  Future<UserProfileModel> getUserProfile();
  Future<List<ProvinceModel>> getProvince(String searchText, int currentIndex);
  Future<List<HotelCategoryModel>> getListHotelCategories();
  Future<List<HotelModelHome>> getListPopularHotel();
  Future<List<CountryModel>> getListCountry(String searchText, int currentIndex);
  Future<List<CartModel>> getListCartItem();
  Future<bool> deleteCartItem(String idCart);
  Future<bool> addToPayment();
  Future<List<PaymentModel>> getListPayment();
}
