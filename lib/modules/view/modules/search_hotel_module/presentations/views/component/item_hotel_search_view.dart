import 'package:final_project_hcmute/core/utils/utils.dart';
import 'package:final_project_hcmute/modules/view/constant/app_images.dart';
import 'package:final_project_hcmute/modules/view/modules/search_hotel_module/presentations/views/component/sale_custom_clipper.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/models/hotel_model.dart';
import '../../../../../../widget/text_custom.dart';
import '../../../../../constant/app_colors.dart';

Widget itemHotelSearch(Hotel data,{required Function() callBack}){
  return GestureDetector(
    onTap: callBack,
    child: Container(
      margin: EdgeInsets.symmetric(vertical:Utils.width(5),horizontal: Utils.width(17)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxHeight: Utils.height(250),
              // minWidth: MediaQuery.of(context).size.width
            ),
            alignment: Alignment.center,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Utils.width(10)),
                  child: Image.network(
                    data.hotelPhotos.isEmpty
                        ? icImageHotelIntro
                        : data.hotelPhotos.split(";").first,
                    scale: 1.5,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: Utils.width(10),
                  child: Visibility(
                    visible: (data.discountHotel??0)!= 0,
                    child: ClipPath(
                      clipper: SaleOffClipper(),
                      child: Container(
                        width: Utils.width(50),
                        height: Utils.height(70),
                        color: colorRatingStar,
                        child: Center(
                          child: Text(
                            "${data.discountHotel??'0'}%",
                            style: const TextStyle(
                                color: colorTextSaleOff,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(Utils.width(2)),
            child: TextCustom(
              data.name,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: Utils.width(17),
                fontWeight: FontWeight.bold,
                color: colorTextBold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(Utils.width(2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .start,
              crossAxisAlignment: CrossAxisAlignment
                  .start,
              children: [
                if(data.rating>=1)
                  const Icon(Icons.star,
                      color: colorRatingStar),
                if(data.rating>=2)
                  const Icon(Icons.star,
                      color: colorRatingStar),
                if(data.rating>=3)
                  const Icon(Icons.star,
                      color: colorRatingStar),
                if(data.rating>=4)
                  const Icon(Icons.star,
                      color: colorRatingStar),
                if(data.rating>=5)
                  const Icon(Icons.star,
                      color: colorRatingStar),
              ],
            ),
          ),
          if(data.discountHotel>0)
            Container(
              margin: EdgeInsets.symmetric(horizontal:Utils.width(2)),
              child:TextCustom(
                "${data.priceHotel} VND/night",
                style: TextStyle(
                    color: colorTextPrice,
                    fontWeight: FontWeight.w600,
                    fontSize: Utils.width(20),decoration: TextDecoration.lineThrough),
              ),
            ),
          Container(
            margin: EdgeInsets.symmetric(horizontal:Utils.width(2)),
            child:TextCustom(
              "${data.discountHotel > 0 ? data.discountPrice : data.priceHotel} VND/night",
              style: TextStyle(
                  color: appBarColor,
                  fontWeight: FontWeight.w600,
                  fontSize: Utils.width(25)),
            ),
          ),
        ],
      ),
    ),
  );
}