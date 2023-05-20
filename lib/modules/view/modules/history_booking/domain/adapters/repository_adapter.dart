
import '../../../payment_module/domain/entities/payment_model.dart';

abstract class IHistoryBookingRepository {
  Future<List<PaymentModel>> getListPayment();
}
