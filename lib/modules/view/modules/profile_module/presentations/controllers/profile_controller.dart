import 'package:final_project_hcmute/modules/view/modules/profile_module/domain/entities/update_user_profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../domain/adapter/repository_adapter.dart';

class ProfileController extends GetxController {
  final IUserProfileRepository userProfileRepository;

  ProfileController({required this.userProfileRepository});

  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastNameEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserProfileData();
  }

  getUserProfileData() async {
    var userProfile = await userProfileRepository.getUserProfile();
    if (userProfile.id != '') {
      firstNameEditingController.text = userProfile.firstName;
      lastNameEditingController.text = userProfile.lastName;
      phoneEditingController.text = userProfile.phone;
      refresh();
    }
  }

  Future<bool> updateUserProfileData() async {
    UpdateUserProfileModel userProfileModel = UpdateUserProfileModel(
        firstName: firstNameEditingController.text,
        lastName: lastNameEditingController.text,
        phone: phoneEditingController.text);
    var userProfile = await userProfileRepository.updateUserProfileData(userProfileModel);
    if (userProfile.id != '') {
      firstNameEditingController.text = userProfile.firstName;
      lastNameEditingController.text = userProfile.lastName;
      phoneEditingController.text = userProfile.phone;
      refresh();
      return true;
    }
    return false;
  }

}
