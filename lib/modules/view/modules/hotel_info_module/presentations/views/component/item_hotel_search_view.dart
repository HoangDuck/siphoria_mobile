import 'package:flutter/material.dart';

import '../../../../../../../core/utils/utils.dart';
import '../../../../../../widget/button_custom.dart';
import '../../../../../../widget/text_custom.dart';
import '../../../../../constant/app_colors.dart';
import 'image_view_component.dart';
import 'item_rateplan_view.dart';

Widget itemHotelRoom(BuildContext context, dynamic data) {
  return Container(
    margin: EdgeInsets.all(Utils.width(10)),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Utils.width(10)),
        color: Colors.white),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(Utils.width(10)),
          child: TextCustom(
            "Executive Suites",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: Utils.width(15),
              fontWeight: FontWeight.bold,
              color: colorTextPrice,
            ),
          ),
        ),
        imageViewWidget(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: Utils.width(15)),
          height: Utils.width(46),
          child: ButtonCustom(
            text: 'Xem chi tiết',
            onPress: (text) {},
            style: TextStyle(
                fontSize: Utils.width(20),
                fontWeight: FontWeight.bold,
                color: colorTitleAmber),
            color: Colors.white,
            borderColor: colorTitleAmber,
          ),
        ),
        itemRateplanView(context),
      ],
    ),
  );
}
