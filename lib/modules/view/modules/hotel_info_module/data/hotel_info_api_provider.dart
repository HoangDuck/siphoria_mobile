import 'dart:convert';

import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/country_model.dart';
import 'package:get/get.dart';

import '../domain/entities/hotel_category_model.dart';
import '../domain/entities/hotel_model.dart';
import '../domain/entities/province_model.dart';

abstract class IHomeProvider {
  Future<Response<List<ProvinceModel>>> getProvince(String searchText, int currentIndex);
  Future<Response<List<HotelCategoryModel>>> getListHotelCategories();
  Future<Response<List<HotelModelHome>>> getListPopularHotel(String searchText, int currentIndex);
  Future<Response<List<CountryModel>>> getCountryList(String searchText, int currentIndex);
}

class HomeProvider extends GetConnect implements IHomeProvider{
  @override
  void onInit() {
    httpClient.baseUrl = 'https://hotels4.p.rapidapi.com';
    super.onInit();
    // httpClient.addRequestModifier((request) {
    //   request.headers['Authorization'] = 'Bearer sdfsdfgsdfsdsdf12345678';
    //   return request;
    // });
  }

  @override
  Future<Response<List<HotelCategoryModel>>> getListHotelCategories() {
    httpClient.baseUrl = 'https://hotels4.p.rapidapi.com';
    // TODO: implement getListHotelCategories
    return get('/summary');
  }

  @override
  Future<Response<List<HotelModelHome>>> getListPopularHotel(String searchText, int currentIndex) {
    httpClient.baseUrl = 'https://hotels4.p.rapidapi.com';
    // TODO: implement getListPopularHotel
    return get('/summary');
  }

  @override
  Future<Response<List<ProvinceModel>>> getProvince(String searchText, int currentIndex) {
    httpClient.baseUrl = 'https://provinces.open-api.vn/';
    httpClient.defaultDecoder = ProvinceModel.listFromJson;
    // TODO: implement getProvince
    // httpClient.defaultDecoder =
    //     (val) => CasesModel.fromJson(val as Map<String, dynamic>);
    return get('/api/p/');
  }

  @override
  Future<Response<List<CountryModel>>> getCountryList(String searchText, int currentIndex) {
    httpClient.baseUrl = 'https://hotels4.p.rapidapi.com';
    httpClient.defaultDecoder = CountryModel.listFromJson;
    return get('/v2/get-meta-data',headers: {
      'X-RapidAPI-Key': 'c5871a9689mshc9cdff683cbaa0ap13ed6ejsna7ffee71a28c',
      'X-RapidAPI-Host': 'hotels4.p.rapidapi.com'
    });
  }
}