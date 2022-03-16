import 'package:flutter/material.dart';
import '/theme/color.dart';
import '/widgets/favorite_box.dart';
import 'custom_image.dart';

class DetailImageItem extends StatelessWidget {
  DetailImageItem(
      {Key? key,
        required this.index,
        required this.data,
        this.width = double.infinity,
        this.height = 300,
        this.onTapFavorite,
        this.onTap})
      : super(key: key);
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
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImage(
              data[index],
              width: double.infinity,
              height: 300,
              radius: 0,
            ),
          ],
        ),
      ),
    );
  }
}