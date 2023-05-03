
// ignore: one_member_abstracts




abstract class IForgotPasswordRepository {
  // Future<TokenModel> signIn(String username, String password);
  Future<bool> sendEmailResetPass(String email);
}
