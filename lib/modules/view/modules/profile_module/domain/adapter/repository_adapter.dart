
import 'package:final_project_hcmute/modules/view/modules/profile_module/domain/entities/user_profile_model.dart';
import 'package:get/get.dart';

import '../entities/update_user_profile_model.dart';



abstract class IUserProfileRepository {
  Future<UserProfileModel> getUserProfile();
  Future<UserProfileModel> updateUserProfileData(UpdateUserProfileModel data);
  Future<UserProfileModel> updateUserProfileAvatar(FormData data);
}
