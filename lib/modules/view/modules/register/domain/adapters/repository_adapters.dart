
import '../../../authentication/domain/entities/token_model.dart';

abstract class IRegisterRepository {
  Future<TokenModel> signUp(String email, String password,String firstName, String lastName);
}
