import 'package:final_project_hcmute/core/services/api_constant.dart';
import 'package:final_project_hcmute/modules/view/modules/home/presentations/controllers/home_controller.dart';
import 'package:final_project_hcmute/modules/view/modules/profile_module/domain/entities/update_user_profile_model.dart';
import 'package:final_project_hcmute/modules/view/modules/profile_module/domain/entities/user_profile_model.dart';
import 'package:get/get.dart';


abstract class IUserProfileProvider {
  Future<Response<UserProfileModel>> getProfile();
  Future<Response<UserProfileModel>> updateUserProfileProfile(UpdateUserProfileModel model);
  Future<Response<UserProfileModel>> updateUserProfileAvatar(FormData data);
}

class UserProfileProvider extends GetConnect
    implements IUserProfileProvider {
  @override
  void onInit() {
    httpClient.baseUrl =baseUrl;
    super.onInit();
  }

  @override
  Future<Response<UserProfileModel>> getProfile() {
    HomeController controller = Get.find<HomeController>();
    // TODO: implement signIn
    httpClient.defaultDecoder = httpClient.defaultDecoder =
        (value) => UserProfileModel.fromJson(value['data'] as Map<String, dynamic>);
    return get(userProfileUrl,headers: {
      'Authorization':'Bearer ${controller.accessToken}'
    });
  }

  @override
  Future<Response<UserProfileModel>> updateUserProfileProfile(UpdateUserProfileModel model) {
    HomeController controller = Get.find<HomeController>();
    // TODO: implement signIn
    httpClient.defaultDecoder = httpClient.defaultDecoder =
        (value) => UserProfileModel.fromJson(value['data'] as Map<String, dynamic>);
    return patch(updateUserProfileUrl,{
      'first_name': model.firstName,
      'last_name': model.lastName,
      'phone': model.phone
    },headers: {
      'Authorization':'Bearer ${controller.accessToken}'
    });
  }

  @override
  Future<Response<UserProfileModel>> updateUserProfileAvatar(FormData data) {
    // TODO: implement updateUserProfileAvatar
    HomeController controller = Get.find<HomeController>();
    // TODO: implement signIn
    httpClient.defaultDecoder = httpClient.defaultDecoder =
        (value) => UserProfileModel.fromJson(value['data'] as Map<String, dynamic>);
    return patch(updateUserProfileUrl,data,headers: {
      'Authorization':'Bearer ${controller.accessToken}'
    });
  }
}
