import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../routers/page_routes.dart';
import '../../../../../../widget/button_custom.dart';
import '../../../../../../widget/text_field_custom.dart';
import '../../../../../constant/app_images.dart';
import '../../controllers/home_controller.dart';

Widget searchHotel(BuildContext context){

  HomeController controller = Get.find<HomeController>();
  return Container(
    margin: EdgeInsets.all(Utils.width(10)),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Utils.width(10),
        ),
        border: Border.all(color: Colors.grey),
        color: Colors.white),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.all(Utils.width(15)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Utils.width(10),
              ),
              border: Border.all(color: Colors.grey),
              color: Colors.white),
          child: TextFieldCustom(
            controller: controller.locationEditController,
            prefixIcon: const Icon(Icons.search,color: Colors.black,),
            hintText: "Bạn sẽ đến đâu",
            hintTextStyle: const TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: Utils.width(15),
              right: Utils.width(15),
              bottom: Utils.width(15)),
          padding: EdgeInsets.all(Utils.width(10)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Utils.width(10),
              ),
              border: Border.all(color: Colors.grey),
              color: Colors.white),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.calendar_today_outlined),
              SizedBox(
                width: Utils.width(10),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Ngày đến",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  Text(
                    "Từ ngày",
                    style: TextStyle(
                        color: Colors.blueGrey, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                width: Utils.width(10),
              ),
              const VerticalDivider(
                width: 10,
                thickness: 1,
                indent: 20,
                endIndent: 0,
                color: Colors.red,
              ),
              SizedBox(
                width: Utils.width(10),
              ),
              const Icon(Icons.calendar_today_outlined),
              SizedBox(
                width: Utils.width(10),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Ngày đi",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  Text(
                    "Đến ngày",
                    style: TextStyle(
                        color: Colors.blueGrey, fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: Utils.width(15),
              right: Utils.width(15),
              bottom: Utils.width(15)),
          padding: EdgeInsets.all(Utils.width(10)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Utils.width(10),
              ),
              border: Border.all(color: Colors.grey),
              color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                icCustomer,
                scale: 1.8,
              ),
              SizedBox(
                width: Utils.width(10),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Khách - Số lượng phòng",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  Text(
                    "1 người, 1 phòng",
                    style: TextStyle(
                        color: Colors.blueGrey, fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: Utils.width(15),
              right: Utils.width(15),
              bottom: Utils.width(15)),
          width: MediaQuery.of(context).size.width,
          height: Utils.width(50),
          child: ButtonCustom(
            text: "Tìm kiếm",
            onPress: (text) {
              Get.toNamed(Routes.searchHotel);
            },
            color: Colors.blue,
            style: TextStyle(
                color: Colors.white,
                fontSize: Utils.width(20),
                fontWeight: FontWeight.bold),
            borderColor: Colors.transparent,
          ),
        )
      ],
    ),
  );
}