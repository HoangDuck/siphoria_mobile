
// ignore: one_member_abstracts




abstract class IChangePasswordRepository {
  // Future<TokenModel> signIn(String username, String password);
  Future<bool> changePassword(String oldPassword, String newPassword);
}
