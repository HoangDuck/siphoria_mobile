part of '../home_view.dart';

Widget _cartPage(BuildContext context) {
  HomeController controller = Get.find<HomeController>();
  return Column(
    children: [
      Expanded(
        child: SingleChildScrollView(
          child: Container(
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
                  onPress: (_) {},
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
          ),
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
                    "Tổng cộng (0 điểm):",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Utils.height(17)),
                  )),
                  TextCustom(
                    "0 VND",
                    style: TextStyle(
                        color: colorTitleAmber,
                        fontWeight: FontWeight.bold,
                        fontSize: Utils.height(25)),
                  )
                ],
              ),
              Expanded(
                child: SizedBox(
                  height: Utils.height(20),
                ),
              ),
              ButtonCustom(
                text: "Thanh toán",
                onPress: (_) {},
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
