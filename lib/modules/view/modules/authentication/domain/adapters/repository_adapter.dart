
// ignore: one_member_abstracts
import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/country_model.dart';
import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/hotel_category_model.dart';
import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/hotel_model.dart';

import '../entities/token_model.dart';


abstract class IAuthenticationRepository {
  Future<TokenModel> signIn(String username, String password);
}
