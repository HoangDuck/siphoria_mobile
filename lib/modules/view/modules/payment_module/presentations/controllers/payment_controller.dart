import 'package:get/get.dart';

import '../../../../constant/app_colors.dart';
import '../../../../constant/app_images.dart';

class PaymentController extends GetxController{
  RxList<dynamic> listPaymentMethod = [
    {
      'key':'Momo',
      'isCheck':true,
      'image':icMomo,
      'color':colorBorderMomo,
      'background':colorBackgroundMomo,
    },
    {
      'key':'VNPay',
      'isCheck':false,
      'image':icPaypal,
      'color': colorBorderVNPay,
      'background':colorBackgroundVNPay,
    }
  ].obs;
}