import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/theme/color.dart';

class RatersBox extends StatelessWidget {
  RatersBox(
      {Key? key,
        this.bgColor = Colors.white,
        this.onTap,
        this.isFavorited = false,
        this.borderColor = Colors.transparent,
        this.radius = 50,
        this.size = 18,
        this.padding = 15})
      : super(key: key);
  final Color borderColor;
  final Color? bgColor;
  final bool isFavorited;
  final double radius;
  final double size;
  final double padding;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        padding: EdgeInsets.all(padding),
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: isFavorited ? red : Colors.white,
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),

      ),
    );
  }
}