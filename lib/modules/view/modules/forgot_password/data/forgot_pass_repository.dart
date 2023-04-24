
import 'package:final_project_hcmute/modules/view/modules/authentication/data/authentication_api_provider.dart';
import 'package:final_project_hcmute/modules/view/modules/authentication/domain/entities/token_model.dart';
import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/country_model.dart';
import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/hotel_category_model.dart';

import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/hotel_model.dart';

import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/province_model.dart';

import '../domain/adapters/repository_adapter.dart';
import 'forgot_api_provider.dart';


class ForgotPasswordRepository implements IForgotPasswordRepository {
  ForgotPasswordRepository({required this.provider});
  final IForgotPasswordProvider provider;

  @override
  Future sendEmailResetPass(String email) async {
    final response = await provider.sendEmailResetPassword(email);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response;
    }
  }


}