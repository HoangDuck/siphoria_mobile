part of '../home_view.dart';

Widget _cartPage(BuildContext context) {
  HomeController controller = Get.find<HomeController>();
  return Column(
    children: [
      Expanded(
        child: SingleChildScrollView(
          child: Obx(() => controller.totalNumberCartItem.value == 0
              ? _emptyCart()
              : _listItemCart(context)),
        ),
      ),
      Container(
        height: Utils.height(110),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Container(
          margin: EdgeInsets.all(Utils.width(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                      child: TextCustom(
                    "Tổng cộng:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Utils.height(17)),
                  )),
                  Obx(()=>TextCustom(
                    "${controller.totalCostCart.value} VND",
                    style: TextStyle(
                        color: colorTitleAmber,
                        fontWeight: FontWeight.bold,
                        fontSize: Utils.height(25)),
                  )),
                ],
              ),
              Expanded(
                child: SizedBox(
                  height: Utils.height(20),
                ),
              ),
              ButtonCustom(
                text: "Tiếp tục",
                onPress: (_) {
                  Get.toNamed(Routes.payment);
                },
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Utils.width(25),
                    fontWeight: FontWeight.bold),
                height: Utils.height(45),
                color: colorTitleAmber,
                borderColor: Colors.transparent,
              )
            ],
          ),
        ),
      )
    ],
  );
}

Widget _listItemCart(BuildContext context){
  HomeController controller = Get.find<HomeController>();
  return Container(
    margin: EdgeInsets.all(Utils.width(15)),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(Utils.width(30)),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 4,
          offset: Offset(2, 8), // Shadow position
        ),
      ],
    ),
    child: Obx(()=>ListView.builder(
        itemCount: controller.listHotelCart.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, indexHotel) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: Utils.width(5)),
            decoration: BoxDecoration(
                color: colorCartItemBackground,
                borderRadius: BorderRadius.circular(Utils.width(5))
            ),
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                initiallyExpanded:true,
                maintainState: true,
                // tilePadding: EdgeInsets.only(bottom: 0),
                title: TextCustom(
                  controller.listHotelCart[indexHotel].toString().split("#").last,
                  style: TextStyle(
                    fontSize: Utils.width(15),
                    fontWeight: FontWeight.bold,
                    color: colorTextPrice,
                  ),
                ),
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: Utils.width(10)),
                      child: const Divider(
                        color: Colors.black26,
                      ),
                    ),
                    listCartItem(
                        context,
                        controller.listCart
                            .where((p0) =>
                                p0.hotelId ==
                                    controller.listHotelCart[indexHotel].toString().split("#").first,)
                            .toList())
                  ],
              ),
            ),
          );
        }),),
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
            Icons.check,
            color: colorTextPrice,
            size: Utils.width(25),
          ),
        ),
        Expanded(
          child: TextCustom(
            Utils.getStringDefine(data),
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

Widget listCartItem(BuildContext context,List<CartModel> listCart){
  HomeController controller = Get.find<HomeController>();
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ListView.builder(
          shrinkWrap: true,
          itemCount: listCart.length,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.symmetric(vertical: Utils.width(10),horizontal: Utils.width(10)),
              padding: EdgeInsets.symmetric(vertical: Utils.width(10),horizontal: Utils.width(10)),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: colorTextPrice.withOpacity(0.1)),
                borderRadius: BorderRadius.circular(Utils.width(5)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextCustom(
                        listCart[index].roomType.name,
                        style: TextStyle(
                          fontSize: Utils.width(15),
                          fontWeight: FontWeight.bold,
                          color: colorTextPrice,
                        ),
                      ),
                      Expanded(child: Container()),
                      GestureDetector(
                        onTap: () async {
                          await controller.deleteCartItem(listCart[index].id);
                        },
                        child: const Icon(
                          Icons.delete,
                          color: colorRatingStar,
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: Utils.width(10)),
                    child: const Divider(color: Colors.black26,),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: listCart[index].details.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index2) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: Utils.width(10),
                              vertical: Utils.width(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(Utils.width(5)),
                                child: Image.network(icImageHotelIntro,scale: 50,),
                              ),
                              SizedBox(width: Utils.width(5),),
                              TextCustom(
                                Utils.convertDateTimeDDMMYYYY(
                                        listCart[index].details[index2].dayOff),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: Utils.width(12),
                                  fontWeight: FontWeight.bold,
                                  color: colorTextPrice,
                                ),
                              ),
                              Expanded(child: Container()),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: Utils.width(10)),
                                child: TextCustom(
                                  "${listCart[index].details[index2].price} VND",
                                  style: TextStyle(
                                      color: colorTextPrice,
                                      fontWeight: FontWeight.w600,
                                      fontSize: Utils.width(15)),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                  for (var k in listCart[index].ratePlans.toJson().keys) ...{
                    if(listCart[index].ratePlans.toJson()[k].toString()=='true'&& k !='activate')
                      _itemRateplanDetail(k),
                  },
                ],
              ),
            );
          }),
      Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
            vertical: Utils.width(10), horizontal: Utils.width(10)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(Utils.width(5)),
              bottomRight: Radius.circular(Utils.width(5))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextCustom(
              "Tổng giá phòng",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: Utils.width(17),
                fontWeight: FontWeight.bold,
                color: colorTextPrice,
              ),
            ),
            Expanded(child: Container()),
            TextCustom(
              "${controller.calculateTotalCostPerHotel(listCart)} VND",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: Utils.width(20),
                fontWeight: FontWeight.bold,
                color: appBarColor,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _emptyCart(){
  HomeController controller = Get.find<HomeController>();
  return Container(
    height: Utils.height(500),
    margin: EdgeInsets.all(Utils.width(10)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(icCart),
        SizedBox(
          height: Utils.height(20),
        ),
        TextCustom(
          "Giỏ hàng của bạn còn trống",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Utils.width(20),
              color: colorTitleBold),
        ),
        SizedBox(
          height: Utils.height(20),
        ),
        TextCustom(
          "Bạn chưa đặt phòng khách sạn cho chuyến du lịch sắp tới? Trải nghiệm ngay cùng với Siphoria nhé!",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: Utils.width(17),
              color: colorTitleMedium),
        ),
        SizedBox(
          height: Utils.height(20),
        ),
        ButtonCustom(
          text: "Đặt chỗ ngay",
          onPress: (_) {
            controller.selectedPageIndex(0);
          },
          color: colorTitleAmber,
          borderRadius: 30,
          borderColor: Colors.transparent,
          style: TextStyle(
              fontSize: Utils.width(17),
              color: Colors.white,
              fontWeight: FontWeight.bold),
          height: Utils.height(50),
          width: Utils.width(170),
        ),
      ],
    ),
  );
}

