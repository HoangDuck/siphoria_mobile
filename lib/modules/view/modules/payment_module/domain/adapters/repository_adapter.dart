

import '../entities/payment_model.dart';

abstract class IPaymentRepository {
  Future<List<PaymentModel>> getListPayment();
  Future<bool> updatePayment(String sessionId);
}
