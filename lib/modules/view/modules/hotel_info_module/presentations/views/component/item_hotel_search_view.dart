import 'package:flutter/material.dart';

import '../../../../../../../core/utils/utils.dart';
import '../../../../../../widget/button_custom.dart';
import '../../../../../../widget/text_custom.dart';
import '../../../../../constant/app_colors.dart';
import 'image_view_component.dart';
Widget itemHotelRoom(BuildContext context, dynamic data){
  return Container(
    margin: EdgeInsets.all(Utils.width(10)),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(Utils.width(10)),
      color: Colors.white
    ),
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
        Row(
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
            Container(
              margin: EdgeInsets.only(top: Utils.width(20)),
              padding: EdgeInsets.symmetric(
                  vertical: Utils.width(10)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                    color: Colors.grey,
                    style: BorderStyle.solid,
                    width: 0.80),
              ),
              alignment: Alignment.center,
              child: StatefulBuilder(
                  builder: (context,setState) {
                    return DropdownButtonHideUnderline(
                      child: DropdownButton<dynamic>(
                        value: 1,
                        alignment: AlignmentDirectional.center,
                        isDense: true,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        style: const TextStyle(color: Colors.grey),
                        onChanged: (value) {
                        },
                        borderRadius:
                        BorderRadius.all(Radius.circular(10)),
                        items: [1,2,3]
                            .map<DropdownMenuItem<dynamic>>((value) {
                          return DropdownMenuItem<dynamic>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      ),
                    );
                  }
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: Utils.width(10)),
          child: const Divider(),
        )
      ],
    ),
  );
}