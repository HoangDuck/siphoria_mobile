
import 'package:final_project_hcmute/modules/view/modules/profile_module/domain/entities/user_profile_model.dart';

import '../entities/update_user_profile_model.dart';



abstract class IUserProfileRepository {
  Future<UserProfileModel> getUserProfile();
  Future<UserProfileModel> updateUserProfileData(UpdateUserProfileModel data);
  // Future<UserProfileModel> updateUserProfileData(UpdateUserProfileModel data);
}
