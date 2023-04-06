import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project_hcmute/core/utils/utils.dart';
import 'package:final_project_hcmute/modules/view/modules/hotel_info_module/presentations/controllers/hotel_info_controller.dart';
import 'package:final_project_hcmute/modules/widget/text_custom.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constant/app_colors.dart';
import '../../../../constant/app_images.dart';
import '../../../search_hotel_module/presentations/views/component/overview_hotel_info.dart';
import 'component/item_hotel_search_view.dart';

class HotelInfoView extends GetView<HotelInfoController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorMainBackground,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Utils.height(250),
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned.fill(
                      top: 0,
                      right: 0,
                      left: 0,
                      bottom: Utils.width(50),
                      child: CarouselSlider(
                          items: [1, 2, 3, 4, 5].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Image.network(
                                  icHoChiMinhCity,
                                  scale: 1,
                                  fit: BoxFit.cover,
                                );
                              },
                            );
                          }).toList(),
                          options: CarouselOptions(
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0,
                            scrollDirection: Axis.horizontal,
                          ))),
                  Positioned.fill(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: Utils.width(50),
                    child: Container(
                      color: Colors.black26,
                    ),
                  ),
                  Positioned.fill(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.all(Utils.width(10)),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                padding: EdgeInsets.all(Utils.width(5)),
                                decoration: BoxDecoration(
                                    color: colorButtonCart.withOpacity(0.7),
                                    borderRadius:
                                        BorderRadius.circular(Utils.width(30))),
                                child: const Icon(Icons.arrow_back_ios_new),
                              ),
                            ),
                            Expanded(child: Container()),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(Utils.width(5)),
                                decoration: BoxDecoration(
                                    color: colorButtonCart.withOpacity(0.7),
                                    borderRadius:
                                        BorderRadius.circular(Utils.width(30))),
                                child: const Icon(Icons.manage_search_rounded),
                              ),
                            ),
                            SizedBox(
                              width: Utils.width(5),
                            ),
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(Utils.width(5)),
                                    decoration: BoxDecoration(
                                        color: colorButtonCart.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(
                                            Utils.width(30))),
                                    child:
                                        const Icon(Icons.shopping_cart_rounded),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    width: Utils.width(18),
                                    height: Utils.width(18),
                                    padding: EdgeInsets.all(Utils.width(5)),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(80),
                                        color: Colors.red),
                                    alignment: Alignment.center,
                                    child: TextCustom(
                                      "2",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Utils.width(7),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: Utils.height(88),
                    child: Container(
                      padding: EdgeInsets.all(Utils.width(10)),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(Utils.width(5)),
                          decoration: BoxDecoration(
                              color: colorButtonCart.withOpacity(0.7),
                              borderRadius:
                                  BorderRadius.circular(Utils.width(30))),
                          child: const Icon(Icons.image),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: Utils.width(10),
                    right: Utils.width(10),
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      height: Utils.height(115),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Utils.width(10),
                          ),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(Utils.width(2)),
                            child: TextCustom(
                              "Hotel HotelLink - HCM Can Gio",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: Utils.width(17),
                                fontWeight: FontWeight.bold,
                                color: colorTextPrice,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(Utils.width(2)),
                                  child: TextCustom(
                                    "9VHH+CQ7, Duyên Hải, Cần Giờ, Thành phố Hồ Chí Minh, Vietnam",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: Utils.width(15),
                                      color: colorTextPrice,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Utils.width(5),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.location_on_sharp,
                                  size: Utils.width(40),
                                  color: colorTitleAmber,
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.all(Utils.width(2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Icon(Icons.star, color: colorRatingStar),
                                Icon(Icons.star, color: colorRatingStar),
                                Icon(Icons.star, color: colorRatingStar),
                                Icon(Icons.star, color: colorRatingStar),
                                Icon(Icons.star, color: colorRatingStar),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    overviewHotelInfo(content: '''<div class="overhtml"><h2>
                    <strong>Đề xuất dân công được quyền đấu giá biển số của 63 tỉnh thành</strong>
                    </h2><p> Thứ trưởng Công an Nguyễn Văn Long cho biết quyết định xây dựng cho
                     phép công dân Việt Nam có quyền đấu giá biển số của tất cả các địa phương.</p>
                     <p> <i>Tại phiên họp chuyên đề luật tháng 9 chiều 22/9, <strong>100% thành</strong> 
                     viên Ban Thường vụ Quốc hội có mặt đồng ý bổ sung vào chương trình xây dựng luật,
                      pháp lệnh năm 2022 nội dung xem xét dự thảo quyết định Quốc hội</i></p><p> 
                      <strong>về các quyền lựa chọn thí nghiệm sử dụng biển số thông qua đấu giá.</strong>
                      </p><p> Thảo luận trước đó về tờ trình của Chính phủ, Chủ nhiệm Chính ngân sách Nguyễn 
                      Phú Cường đề nghị xác định một số nội dung như "người dân ở tỉnh này đã được sang khác 
                      tham gia đấu giá biển số không ? ”.</p><p> Ban biên tập cũng cần giải thích thêm tại sao 
                      lại chia nguồn lệ phí từ đấu giá <strong>là 70%</strong> cho ngân sách Trung ương và <strong>30%
                      </strong> cho biển số địa phương.</p><p> 
                      <a href="https://vnexpress.net/de-xuat-cong-dan-duoc-quyen-dau-gia-bien-so-xe-cua-63-tinh-thanh-4514509.html">Link báo</a></p></div>'''),
                    Container(
                      margin: EdgeInsets.all(Utils.width(10)),
                      child: TextCustom(
                        "Danh sách phòng",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: Utils.width(20),
                          fontWeight: FontWeight.bold,
                          color: colorTextPrice,
                        ),
                      ),
                    ),
                    ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return itemHotelRoom(context,"1");
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
