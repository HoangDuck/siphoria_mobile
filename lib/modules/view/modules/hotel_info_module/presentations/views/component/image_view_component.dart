
import 'package:final_project_hcmute/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../constant/app_images.dart';

Widget imageViewWidget(List<String> images){
  return Container(
    margin: EdgeInsets.all(Utils.width(10)),
    child: StaggeredGrid.count(
      crossAxisCount: 3,
      mainAxisSpacing: 3,
      crossAxisSpacing: 4,
      children: [
        if(images.first != "")
          StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 1,
            child: Image.network(
              images.first,
              scale: 1,
              fit: BoxFit.cover,
            ),
          ),
        for(int index=1;index<images.length;index++)...{
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Image.network(
              images[index],
              scale: 1,
              fit: BoxFit.cover,
            ),
          ),
        },

      ],
    ),
  );
}