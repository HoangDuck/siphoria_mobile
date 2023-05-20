part of '../home_view.dart';

Widget _homePage(BuildContext context) {
  HomeController controller = Get.find<HomeController>();
  return SingleChildScrollView(
    child: Container(
      margin: EdgeInsets.all(Utils.width(10)),
      child: Visibility(
        visible: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchHotel(context),
            SizedBox(
              height: Utils.width(20),
            ),
            Text(
              "Điểm đến hấp dẫn hàng đầu Việt Nam",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Utils.width(30)),
            ),
            Obx(
              () => SizedBox(
                height: Utils.width(200),
                child: ListView.builder(
                  itemCount: controller.listProvinces.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap:(){
                        if (!(controller.isDateRangeEditEmpty.value)) {
                          controller.startDate = DateTime.now();
                          controller.endDate = DateTime.now().add(const Duration(days:1));
                        }
                        controller.locationEditController.text = controller.listProvinces[index].name;
                        Get.toNamed(Routes.searchHotel);
                      },
                      child: Container(
                        margin: EdgeInsets.all(Utils.width(10)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Utils.width(30),
                            ),
                            color: Colors.white),
                        child: Stack(
                          children: [
                            Container(
                                height: Utils.width(200),
                                width: Utils.width(150),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(Utils.width(30)),
                                    color: Colors.white),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    icHcmCity,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            Positioned(
                              top: 0,
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(Utils.width(15)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(Utils.width(30)),
                                  ),
                                  child: Container(
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              bottom: Utils.width(10),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  controller.listProvinces[index].name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: Utils.width(30),
            ),
            Text(
              "Loại hình khách sạn",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Utils.width(30)),
            ),
            Obx(
              () => Container(
                height: Utils.width(200),
                child: ListView.builder(
                  itemCount: controller.listResort.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap:(){
                        if (!(controller.isDateRangeEditEmpty.value)) {
                          controller.startDate = DateTime.now();
                          controller.endDate = DateTime.now().add(const Duration(days:1));
                        }
                        controller.locationEditController.text = controller.listResort[index];
                        Get.toNamed(Routes.searchHotel);
                      },
                      child: Container(
                        margin: EdgeInsets.all(Utils.width(10)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Utils.width(30),
                            ),
                            color: Colors.white),
                        child: Stack(
                          children: [
                            Container(
                                height: Utils.width(200),
                                width: Utils.width(150),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(Utils.width(30)),
                                    color: Colors.white),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    icResort,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            Positioned(
                              top: 0,
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(Utils.width(15)),
                                child: Container(
                                  color: Colors.black.withOpacity(0.2),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              bottom: Utils.width(10),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  controller.listResort[index],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: Utils.width(30),
            ),
            // Text(
            //   "Khách sạn được yêu thích",
            //   style: TextStyle(
            //       fontWeight: FontWeight.bold, fontSize: Utils.width(30)),
            // ),
            // Container(
            //   margin: EdgeInsets.all(Utils.width(5)),
            //   child: ListView.builder(
            //       itemCount: 5,
            //       shrinkWrap: true,
            //       physics: const NeverScrollableScrollPhysics(),
            //       itemBuilder: (context, index) {
            //         // return itemHotelSearch("1",callBack: (){
            //         //   Get.toNamed(Routes.hotelInfo);
            //         // });
            //         return Container();
            //       }),
            // ),
          ],
        ),
      ),
    ),
  );
}
