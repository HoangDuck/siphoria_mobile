
// ignore: one_member_abstracts
import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/country_model.dart';
import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/hotel_category_model.dart';
import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/hotel_model.dart';

import '../../../../../../core/models/hotel_model.dart';
import '../entities/province_model.dart';

abstract class ISearchHotelRepository {
  Future<List<Hotel>> getListHotelMobile();
}
