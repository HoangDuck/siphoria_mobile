import 'dart:convert';

import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/country_model.dart';
import 'package:get/get.dart';

import '../../../../../core/models/hotel_model.dart';
import '../../../../../core/services/api_constant.dart';
import '../domain/entities/hotel_category_model.dart';
import '../domain/entities/hotel_model.dart';
import '../domain/entities/province_model.dart';

abstract class ISearchHotelProvider {
  Future<Response<List<Hotel>>> getListHotelMobile();
}

class SearchHotelProvider extends GetConnect implements ISearchHotelProvider{
  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;
    super.onInit();
    // httpClient.addRequestModifier((request) {
    //   request.headers['Authorization'] = 'Bearer sdfsdfgsdfsdsdf12345678';
    //   return request;
    // });
  }

  @override
  Future<Response<List<Hotel>>> getListHotelMobile() {
    httpClient.defaultDecoder = Hotel.listFromJson;
    return get(getListHotelUrl);
  }
}