

import '../domain/adapters/repository_adapter.dart';
import 'change_password_api_provider.dart';


class ChangePasswordRepository implements IChangePasswordRepository {
  ChangePasswordRepository({required this.provider});
  final IChangePasswordProvider provider;

  @override
  Future<bool> changePassword(String oldPassword, String newPassword) async {
    // TODO: implement changePassword
    final response = await provider.changePassword(oldPassword, newPassword);
    if (response.status.hasError) {
      return false;
    } else {
      return true;
    }
  }

}