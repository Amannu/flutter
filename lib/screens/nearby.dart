import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/custom_textbox.dart';
import '../widgets/nearby_item.dart';
import '../widgets/search_item.dart';
import '/theme/color.dart';
import '/utils/data.dart';
import '/widgets/custom_image.dart';
import '/widgets/icon_box.dart';
import '/widgets/setting_item.dart';

class NearbyPage extends StatefulWidget {
  const NearbyPage({Key? key}) : super(key: key);

  @override
  _NearbyPageState createState() => _NearbyPageState();
}

class _NearbyPageState extends State<NearbyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBgColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: appBarColor,
              pinned: true,
              snap: true,
              floating: true,
              title: getAppBar(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) => buildBody(),
                childCount: 1,
              ),
            )
          ],
        ));
  }

  Widget getAppBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nearby",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          IconBox(
            child: SvgPicture.asset(
              "assets/icons/search.svg",
              width: 18,
              height: 18,
            ),
            bgColor: appBgColor,
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.where_to_vote_rounded,
                    color: mainColor,
                    size: 24,
                  ),
                  SizedBox(width: 3,
                  ),
                  Text(
                    "Nearby Hotels",
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
              child:Row(
                children: [
                  Text(
                    "25+ hotels found near you",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    getNearbyList(),
                  ]
                ),
              ),
            ],
        ),
      ),
    );
  }
  getNearbyList(){
    return
      Container(
       child: Column(
          children: List.generate(
            features.length,
                (index) => NearbyItem(
              data: features[index],
              onTapFavorite: () {
              setState(() {
              features[index]["is_favorited"] =
              !features[index]["is_favorited"];
              });},
              onTap: () {},
            ),
          ),
        ),
      );
  }
}