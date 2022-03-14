import 'package:flutter/material.dart';
import '/theme/color.dart';
import 'custom_image.dart';
import 'favorite_box.dart';

class NearbyItem extends StatelessWidget {
  NearbyItem({Key? key, required this.data, this.onTap, this.onTapFavorite }) : super(key: key);
  final data;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onTapFavorite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
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
              CustomImage(
                data["image"],
                radius: 15,
                height: 80,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data["name"],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        FavoriteBox(
                          size: 16,
                          onTap: onTapFavorite,
                          isFavorited: data["is_favorited"],
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 14,
                          color: yellow,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Expanded(
                          child: Text(
                            data["rate"]+" (275)",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(Icons.place_outlined, color: Colors.grey, size: 14,),
                        SizedBox(width: 3,),
                        Text(data["location"], style: TextStyle(fontSize: 13, color: Colors.grey),),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}