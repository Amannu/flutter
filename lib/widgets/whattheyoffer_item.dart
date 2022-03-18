import 'package:flutter/material.dart';
import '/theme/color.dart';
import 'custom_image.dart';
import 'detailoffer_item.dart';

class WhatTheyOfferItem extends StatelessWidget {
  WhatTheyOfferItem({Key? key,required this.data}) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          height: 110,
          child: Row(
          children: List.generate(
            data["offer"].length,
                (index) => DetailOfferItem(
              data: data["offer"][index],
            ),
          ),
        ),),
      );
  }
}