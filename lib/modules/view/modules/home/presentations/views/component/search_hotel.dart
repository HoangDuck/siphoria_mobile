import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../routers/page_routes.dart';
import '../../../../../../widget/button_custom.dart';
import '../../../../../../widget/text_field_custom.dart';
import '../../../../../constant/app_colors.dart';
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
          child: Container(
            margin: EdgeInsets.only(left: Utils.width(10)),
            child: Autocomplete(
              fieldViewBuilder: (context,controller,focus,onFieldSubmitted){
                return TextFieldCustom(
                  controller: controller,
                  focusNode: focus,
                  prefixIcon: const Icon(Icons.search,color: Colors.black,),
                  hintText: "Bạn sẽ đến đâu",
                  hintTextStyle: const TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w500),
                  callBack: (value){
                    onFieldSubmitted();
                  },
                );
              },
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return controller.listProvinces.value.where((option) {
                  return option.name
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (selection) {
                debugPrint('You just selected ${selection}');
              },
            ),
          ),
        ),
        GestureDetector(
          onTap:(){
            showCustomDateRangePicker(
              context,
              dismissible: true,
              minimumDate: DateTime.now().subtract(const Duration(days: 30)),
              maximumDate: DateTime.now().add(const Duration(days: 30)),
              endDate: controller.endDate,
              startDate: controller.startDate,
              backgroundColor: Colors.white,
              primaryColor: appBarColor,
              onApplyClick: (start, end) {
                controller.endDate = end;
                controller.startDate = start;
              },
              onCancelClick: () {
                controller.endDate = null;
                controller.startDate = null;
              },
            );
          },
          child: Container(
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
                Expanded(child: Row(
                  children:[
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
                      children:  [
                        Text(
                          "Ngày đến",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w500,
                              fontSize: Utils.width(13)),
                        ),
                        Text(
                        controller.startDate != null
                            ? DateFormat("dd/MM/yyyy").format(DateFormat("yyyy-MM-dd HH:mm").parse(controller.startDate.toString())).toString()
                            : "Từ ngày",
                        style: TextStyle(
                              color: Colors.blueGrey, fontSize: Utils.width(15)),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: Utils.width(10),
                    ),
                  ]
                )),
                const VerticalDivider(
                  width: 10,
                  thickness: 1,
                  indent: 20,
                  endIndent: 0,
                  color: Colors.red,
                ),
                Expanded(child: Row(
                  children:[
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
                      children: [
                        Text(
                          "Ngày đi",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w500,
                              fontSize: Utils.width(13)),
                        ),
                        Text(
                          controller.endDate != null
                              ? DateFormat("dd/MM/yyyy").format(DateFormat("yyyy-MM-dd HH:mm").parse(controller.endDate.toString())).toString()
                              : "Từ ngày",
                          style: TextStyle(
                              color: Colors.blueGrey, fontSize: Utils.width(15)),
                        ),
                      ],
                    ),
                  ]
                )),

              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: Utils.width(15),
              right: Utils.width(15),
              bottom: Utils.width(15)),
          padding: EdgeInsets.all(Utils.width(10)),
          alignment: Alignment.center,
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
              SizedBox(
                width: Utils.width(10),
              ),
              Image.asset(
                icCustomer,
                scale: 1.8,
              ),
              SizedBox(
                width: Utils.width(20),
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