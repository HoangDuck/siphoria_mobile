
import 'package:final_project_hcmute/modules/view/modules/authentication/data/authentication_api_provider.dart';
import 'package:final_project_hcmute/modules/view/modules/authentication/domain/entities/token_model.dart';
import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/country_model.dart';
import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/hotel_category_model.dart';

import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/hotel_model.dart';

import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/province_model.dart';
import 'package:final_project_hcmute/modules/view/modules/profile_module/domain/entities/user_profile_model.dart';

import '../domain/adapter/repository_adapter.dart';
import '../domain/entities/update_user_profile_model.dart';
import 'userprofile_api_provider.dart';



class UserProfileRepository implements IUserProfileRepository {
  UserProfileRepository({required this.provider});
  final IUserProfileProvider provider;


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
  Future<UserProfileModel> updateUserProfileData(UpdateUserProfileModel data) async {
    // TODO: implement updateUserProfileData
    final response = await provider.updateUserProfileProfile(data);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }

}