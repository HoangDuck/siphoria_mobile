
import 'package:final_project_hcmute/modules/view/modules/payment_module/data/payment_api_provider.dart';
import 'package:final_project_hcmute/modules/view/modules/payment_module/domain/adapters/repository_adapter.dart';
import 'package:final_project_hcmute/modules/view/modules/payment_module/domain/entities/payment_model.dart';

class PaymentRepository implements IPaymentRepository{
  PaymentRepository({required this.provider});
  final IPaymentProvider provider;

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

  @override
  Future<bool> updatePayment(String sessionId) async {
    // TODO: implement updatePayment
    final response = await provider.updatePayment(sessionId);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }
}