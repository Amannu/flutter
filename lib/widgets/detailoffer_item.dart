import 'package:flutter/material.dart';
import '/theme/color.dart';
import 'custom_image.dart';

class DetailOfferItem extends StatelessWidget {
  DetailOfferItem({Key? key,required this.index, required this.data, this.onTap}) : super(key: key);
  int index;
  final data;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(10),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
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
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("icon here:$index"),
                    Text("text here:$index"),

                  ],
                ),
              )
            ],
          )),
    );
  }
}