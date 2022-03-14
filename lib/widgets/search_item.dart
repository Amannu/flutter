import 'package:flutter/material.dart';
import '/theme/color.dart';

import 'custom_image.dart';
import 'favorite_box.dart';
import 'icon_box.dart';

class SearchItem extends StatelessWidget {
  SearchItem({ Key? key,
    required this.data,
    this.width = double.infinity,
    this.height = 270,
    this.onTap,
    this.onTapFavorite }) : super(key: key);
  final data;
  final double width;
  final double height;
  final GestureTapCallback? onTapFavorite;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
        child: Container(
        width: width,
        height: height,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.1),
            spreadRadius: .5,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          CustomImage(
            data["image"],
            radius: 25, width: double.infinity, height: 180,
          ),
          Positioned(
              right: 20, top: 160,
              child: FavoriteBox(
                size: 16,
                onTap: onTapFavorite,
                isFavorited: data["is_favorited"],
              )
          ),
          Positioned(
              left: 15, top: 190,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data["name"], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Text(data["type"], style: TextStyle(fontSize: 13, color: Colors.grey),),

                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Icon(Icons.place_outlined, color: Colors.grey, size: 16,),
                      SizedBox(width: 3,),
                      Text(data["location"], style: TextStyle(fontSize: 13, color: Colors.grey),),
                    ],
                  ),
                  SizedBox(height: 5,),

                ],
              )
          ),
          Positioned(
              right:15, top: 190,
              child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(" ", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Text(data["price"], style: TextStyle(fontSize: 15, color: primary, fontWeight: FontWeight.w500),),
                      Text(" / night", style: TextStyle(fontSize: 13, color: Colors.grey),),
                      ],
                      ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      SizedBox(width: 40,),
                      Icon(Icons.star, size: 16, color: yellow,),
                      SizedBox(width: 3,),
                      Text(data["rate"], style: TextStyle(fontSize: 12, color: Colors.grey),),
                      ],
                    ),
                  SizedBox(height: 5,),
              ],


          ),


          ),
        ],
          ),
        ),);
  }
}