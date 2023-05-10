import 'package:final_project_hcmute/modules/view/modules/authentication/domain/entities/token_model.dart';
import 'package:final_project_hcmute/modules/view/modules/register/data/register_api_provider.dart';

import '../domain/adapters/repository_adapters.dart';

class RegisterRepository implements IRegisterRepository {
  RegisterRepository({required this.provider});

  final IRegisterProvider provider;

  @override
  Future<TokenModel> signUp(
      String email, String password, String firstName, String lastName) async {
    final response =
        await provider.signUp(email, password, firstName, lastName);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }
}
