import 'package:flutter/material.dart';
import '../utils/data.dart';
import '/theme/color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'detailimage_item.dart';
import 'detailoffer_item.dart';
import 'favorite_box.dart';
import 'raters_box.dart';
import 'whattheyoffer_item.dart';

class DetailDescriptionItem extends StatelessWidget {
  DetailDescriptionItem({ Key? key,
    required this.index,
    required this.data,
    this.width = double.infinity,
    this.height =600,
    this.onTap,
    this.onTapFavorite }) : super(key: key);
  final int index;
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
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
          children: [CarouselSlider(
        options: CarouselOptions(
        height: 300,
          viewportFraction: 1,
          disableCenter: true,
        ),
        items: List.generate(
          albumImages.length,
              (index) => DetailImageItem(index: index,
            data: features[index]["album_images"],
          ),
        ),
      ),

      Container(
        width: width,
        height: 435,
        margin: EdgeInsets.fromLTRB(0, 280, 0, 0),
        decoration: BoxDecoration(
          color: appBgColor,
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
      ),
            Positioned(
                left: 15, top:315,
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data["name"], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                    SizedBox(height: 5,),
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
              right:15, top: 315,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("   "+data["price"], style: TextStyle(fontSize: 15, color: primary, fontWeight: FontWeight.w500),),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text("per night", style: TextStyle(fontSize: 12, color: Colors.grey),),
                    ],
                  ),
                  SizedBox(height: 5,),
                ],
              ),
            ),
            Positioned(
              left:15, top: 400,
              child:
              Text("What they offer", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
            ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 430, 0, 0),
                child:
                WhatTheyOfferItem(data:data),
              ),
            Positioned(
              left:15, top: 550,
              child:
              Text("Description", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
            ),
            Positioned(
              left:15, top: 570,right: 15,
              child:
              Text(data["description"], style: TextStyle(fontSize: 14,color: Colors.grey),),
            ),
          ],
        ),
      ),
    );
  }}