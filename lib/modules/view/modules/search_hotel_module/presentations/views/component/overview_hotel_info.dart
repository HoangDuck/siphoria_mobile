import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../widget/text_custom.dart';
import '../../../../../constant/app_colors.dart';

Widget overviewHotelInfo({String content=''}){
  return Container(
    margin: EdgeInsets.all(Utils.width(10)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(Utils.width(2)),
          child: TextCustom(
            "Tổng quan",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: Utils.width(20),
              fontWeight: FontWeight.bold,
              color: colorTextPrice,
            ),
          ),
        ),
        HtmlWidget(content),
      ],
    ),
  );
}