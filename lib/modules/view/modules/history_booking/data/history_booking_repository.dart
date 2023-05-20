
import 'package:final_project_hcmute/modules/view/modules/payment_module/domain/entities/payment_model.dart';

import '../domain/adapters/repository_adapter.dart';
import 'history_booking_api_provider.dart';

class HistoryBookingRepository implements IHistoryBookingRepository {
  HistoryBookingRepository({required this.provider});

  final IHistoryBookingProvider provider;

  @override
  Future<List<PaymentModel>> getListPayment() async {
    // TODO: implement getListPayment
    final response = await provider.getListPaymentMobile();
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }
}