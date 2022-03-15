import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/bottombar_item.dart';
import '/theme/color.dart';
import '/widgets/icon_box.dart';
import 'explore.dart';
import 'home.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key,required this.index}) : super(key: key);
  final int index;
  @override
  _DetailPageState createState() => _DetailPageState(index);
}

class _DetailPageState extends State<DetailPage> {
  int index;
  _DetailPageState(this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBgColor,
        bottomNavigationBar: getBottomBar(),
        body:
        CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              pinned: true,
              snap: true,
              floating: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: IconBox(child:
                Icon(
                  Icons.arrow_back_ios_outlined, color: mainColor,
                )
                ),
              ),
              title: getAppBar(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) => buildBody(context),
                childCount: 1,
              ),
            )
          ],
        ));
  }
  Widget getAppBar() {
    return SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            ]
        )
    );
  }

  Widget buildBody(BuildContext context){
    return SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.index.toString())
            ]
        )
    );
  }
  Widget getBottomBar() {
    List barItems = [
      {
        "icon": "assets/icons/call.svg",
        "page": HomePage(),
      },
      {
        "icon": "assets/icons/search.svg",
        "page": ExplorePage(),
      }
    ];
    return Container(
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            barItems.length,
                (index) => BottomBarItem(
              barItems[index]["icon"],
              activeColor: primary,
              onTap: () {
              },
            ),
          ),
        ),
      ),
    );
  }
}