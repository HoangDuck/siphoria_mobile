
import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/cart_item_model.dart';
import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/country_model.dart';
import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/hotel_category_model.dart';

import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/hotel_model.dart';

import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/province_model.dart';
import 'package:final_project_hcmute/modules/view/modules/profile_module/domain/entities/user_profile_model.dart';

import '../domain/adapters/repository_adapter.dart';
import 'home_api_provider.dart';

class HomeRepository implements IHomeRepository {
  HomeRepository({required this.provider});
  final IHomeProvider provider;

  @override
  Future<List<HotelCategoryModel>> getListHotelCategories() async {
    final response = await provider.getListHotelCategories();
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }

  @override
  Future<List<HotelModelHome>> getListPopularHotel() async {
    final response = await provider.getListPopularHotel('',0);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }

  @override
  Future<List<ProvinceModel>> getProvince(String searchText, int currentIndex) async {
    final response = await provider.getProvince('',0);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }

  @override
  Future<List<CountryModel>> getListCountry(String searchText, int currentIndex) async {
    // TODO: implement getListCountry
    final response = await provider.getCountryList('',0);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }

  @override
  Future<UserProfileModel> getUserProfile() async {
    // TODO: implement getUserProfile
    final response = await provider.getProfile();
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }

  @override
  Future<List<CartModel>> getListCartItem() async {
    // TODO: implement getListCartItem
    final response = await provider.getListCartItem();
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }
}