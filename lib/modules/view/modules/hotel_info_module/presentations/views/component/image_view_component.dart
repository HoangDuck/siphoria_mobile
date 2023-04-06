
import 'package:final_project_hcmute/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../constant/app_images.dart';

Widget imageViewWidget(){
  return Container(
    margin: EdgeInsets.all(Utils.width(10)),
    child: StaggeredGrid.count(
      crossAxisCount: 3,
      mainAxisSpacing: 3,
      crossAxisSpacing: 4,
      children: [
        StaggeredGridTile.count(
          crossAxisCellCount: 3,
          mainAxisCellCount: 1,
          child: Image.network(
            icHoChiMinhCity,
            scale: 1,
            fit: BoxFit.cover,
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Image.network(
            icHoChiMinhCity,
            scale: 1,
            fit: BoxFit.cover,
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Image.network(
            icHoChiMinhCity,
            scale: 1,
            fit: BoxFit.cover,
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Image.network(
            icHoChiMinhCity,
            scale: 1,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}