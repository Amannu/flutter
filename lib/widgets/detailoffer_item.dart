import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/theme/color.dart';
import 'custom_image.dart';

class DetailOfferItem extends StatelessWidget {
  DetailOfferItem({Key? key, required this.data, this.onTap}) : super(key: key);
  final data;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.only(right: 10),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

                    SvgPicture.asset(
                      data["icon"],
                      width: 25,
                      height: 25,
                      alignment: Alignment.center,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10,),
                    Text(data["name"].toString(),textAlign: TextAlign.center, style: TextStyle(fontSize: 13,color: Colors.grey),),

            ],
          )),
    );
  }
}