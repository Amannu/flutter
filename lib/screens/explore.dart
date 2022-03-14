import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/search_item.dart';
import '../widgets/category_item.dart';
import '/theme/color.dart';
import '/utils/data.dart';
import '/widgets/city_item.dart';
import '/widgets/custom_textbox.dart';
import '/widgets/icon_box.dart';
import '/widgets/recommend_item.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({ Key? key }) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return
      CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: appBgColor,
            pinned: true,
            snap: true,
            floating: true,
            title: getHeader(),
          ),
          SliverToBoxAdapter(
            child: getBody()
          )
        ],
      );
  }

  getHeader(){
    return
      Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Explore",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  getBody(){
    return
      SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                getSearch(),
                SizedBox(height: 10,),
                getCategories(),
                getSearchList(),
                SizedBox(height: 20,),

                SizedBox(height: 20,),

                SizedBox(height: 100,),
              ]
          )
      );
  }
  getSearch(){
    return
      Row(
        children: [
          SizedBox(width: 10,),
          Expanded(
              child: CustomTextBox(hint: "Search", prefix: Icon(Icons.search, color: Colors.grey), )
          ),
          SizedBox(width: 10,),
          IconBox(child: SvgPicture.asset(
            "assets/icons/filter.svg",
            width: 20,
            height: 20,
            color: Colors.white,
          ), bgColor: primary),
          SizedBox(width: 10,),
        ],
      );
  }
  int selectedIndex = 0;
  getCategories() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 5, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
              (index) => Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CategoryItem(
              data: categories[index],isSelected: index == selectedIndex,
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
  getSearchList(){
    return
      Container(
        margin: EdgeInsets.only(right: 15, left: 15),
        child: Column(
            children: List.generate(
          features.length,
              (index) => SearchItem(
            data: features[index],
            onTapFavorite: () {
              setState(() {
                features[index]["is_favorited"] =
                !features[index]["is_favorited"];
              });
            },
            onTap: () {},
          ),
        ),
        ),
      );


  }
}