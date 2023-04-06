
import 'package:flutter/material.dart';

import '../../../../../../../core/utils/utils.dart';
import '../../../../../../widget/button_custom.dart';
import '../../../../../../widget/text_custom.dart';
import '../../../../../constant/app_colors.dart';

Widget itemRateplanView(BuildContext context){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(Utils.width(10)),
            child: TextCustom(
              "Executive Suites",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: Utils.width(17),
                fontWeight: FontWeight.bold,
                color: colorTextPrice,
              ),
            ),
          ),
          Expanded(child: Container()),
          Container(
            margin: EdgeInsets.only(
              top: Utils.width(20),
              right: Utils.width(20),
            ),
            padding: EdgeInsets.symmetric(vertical: Utils.width(10)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  color: colorTitleAmber,
                  style: BorderStyle.solid,
                  width: 0.80),
            ),
            alignment: Alignment.center,
            child: StatefulBuilder(builder: (context, setState) {
              return DropdownButtonHideUnderline(
                child: DropdownButton<dynamic>(
                  value: 1,
                  alignment: AlignmentDirectional.center,
                  isDense: true,
                  icon: const Icon(Icons.arrow_drop_down,
                      color: colorTitleAmber),
                  elevation: 10,
                  style: const TextStyle(
                      color: colorTitleAmber, fontWeight: FontWeight.bold),
                  onChanged: (value) {},
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  items: [1, 2, 3].map<DropdownMenuItem<dynamic>>((value) {
                    return DropdownMenuItem<dynamic>(
                      value: value,
                      child: Container(
                        padding: EdgeInsets.only(left: Utils.width(10)),
                        child: Text("$value Phòng"),
                      ),
                    );
                  }).toList(),
                ),
              );
            }),
          )
        ],
      ),
      ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return _itemRateplanDetail("1");
          }),
      Container(
        margin: EdgeInsets.only(top: Utils.width(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: Utils.width(5)),
              width: Utils.width(140),
              height: Utils.width(46),
              child: ButtonCustom(
                text: 'Thêm vào giỏ hàng',
                alignment: TextAlign.center,
                onPress: (text) {},
                style: TextStyle(
                    fontSize: Utils.width(15),
                    color: colorTitleAmber),
                color: Colors.white,
                borderColor: colorTitleAmber,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Utils.width(5)),
              width: Utils.width(140),
              height: Utils.width(46),
              child: ButtonCustom(
                text: 'Đặt ngay',
                alignment: TextAlign.center,
                onPress: (text) {},
                style: TextStyle(
                    fontSize: Utils.width(15),
                    color: Colors.white),
                color: colorTitleAmber,
                borderColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
      Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(Utils.width(10)),
                child: TextCustom(
                  "Giá trung bình 1 đêm",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: Utils.width(12),
                    fontWeight: FontWeight.bold,
                    color: colorTextPrice,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: Utils.width(10)),
                    child:TextCustom(
                      "20000 VND",
                      style: TextStyle(
                          color: colorTextPrice,
                          fontWeight: FontWeight.w600,
                          fontSize: Utils.width(15),decoration: TextDecoration.lineThrough),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: Utils.width(5)),
                      child: TextCustom(
                        "- 10%",
                        style: TextStyle(
                            color: appBarColor,
                            fontWeight: FontWeight.w600,
                            fontSize: Utils.width(12)),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: Utils.width(10)),
                child: TextCustom(
                  "20000 VND",
                  style: TextStyle(
                      color: colorPriceRoom,
                      fontWeight: FontWeight.w600,
                      fontSize: Utils.width(20)),
                ),
              ),
            ],
          ),
          Positioned(
            child: Container(
              margin: EdgeInsets.only(top: Utils.height(40)),
              child: ExpansionTile(
                // tilePadding: EdgeInsets.only(bottom: 0),
                title: TextCustom(
                  "Xem chi tiết",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: Utils.width(15),
                    fontWeight: FontWeight.bold,
                    color: colorTextPrice,
                  ),
                ),
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: Utils.width(10)),
                    child: const Divider(),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: Utils.width(10),
                              vertical: Utils.width(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextCustom(
                                "06 tháng 4, 2023",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: Utils.width(15),
                                  fontWeight: FontWeight.bold,
                                  color: colorTextPrice,
                                ),
                              ),
                              Expanded(child: Container()),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextCustom(
                                    "- 10%",
                                    style: TextStyle(
                                        color: appBarColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: Utils.width(10)),
                                  ),
                                  TextCustom(
                                    "20000 VND",
                                    style: TextStyle(
                                        color: colorTextPrice,
                                        fontWeight: FontWeight.w600,
                                        fontSize: Utils.width(10),
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: Utils.width(5),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: Utils.width(10)),
                                child: TextCustom(
                                  "20000 VND",
                                  style: TextStyle(
                                      color: colorPriceRoom,
                                      fontWeight: FontWeight.w600,
                                      fontSize: Utils.width(15)),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: Utils.width(10)),
        child: const Divider(),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(Utils.width(10)),
            child: TextCustom(
              "Tổng tiền",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: Utils.width(17),
                fontWeight: FontWeight.bold,
                color: colorTextPrice,
              ),
            ),
          ),
          Expanded(child: Container()),
          Container(
            margin: EdgeInsets.all(Utils.width(10)),
            child: TextCustom(
              "20000 VND",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: Utils.width(20),
                fontWeight: FontWeight.bold,
                color: appBarColor,
              ),
            ),
          ),
        ],
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: Utils.width(10)),
        child: const Divider(),
      ),
    ],
  );
}

Widget _itemRateplanDetail(dynamic data){
  return Container(
    margin: EdgeInsets.all(Utils.width(5)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: Utils.width(5)),
          child: Icon(
            Icons.airport_shuttle_rounded,
            color: colorTitleAmber,
            size: Utils.width(25),
          ),
        ),
        Expanded(
          child: TextCustom(
            "6 người lớn, 3 trẻ em",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: Utils.width(15),
              color: colorTextPrice,
            ),
          ),
        ),
      ],
    ),
  );
}