import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/search_item.dart';
import '../widgets/category_item.dart';
import '/theme/color.dart';
import '/utils/data.dart';
import '/widgets/icon_box.dart';
import 'detail.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({ Key? key }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();
  List<dynamic> newDataList = List.from(features);
  int selectedIndex = 0;
  List<dynamic> newCatagorisedDataList = List.from(features);
  List<dynamic> fCatagorisedDataList= List.from(features);
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
                children: const [
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
    List filteredCategory=List.generate(features.length, (index) => features[index]["type"]);
    filteredCategory.insert(0, "All");
    final uniqueFiltered = filteredCategory.toSet().toList();
    final listedFiltered= fCatagorisedDataList.toSet().toList();
    return
      SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                //Search Box Position
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(bottom: 3),
                        height: 40,
                        decoration: BoxDecoration(
                          color: textBoxColor,
                          border: Border.all(color: textBoxColor),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: shadowColor.withOpacity(0.05),
                              spreadRadius: .5,
                              blurRadius: .5,
                              offset: Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextField(
                          readOnly: false,
                          controller: controller,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search, color: Colors.grey),
                              border: InputBorder.none,
                              hintText: "Search",
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 15),),
                          onChanged: onItemChanged,
                        ),
                      ),
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
                ),
                SizedBox(height: 10,),
                //Categories Position
                SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(15, 5, 0, 10),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      uniqueFiltered.length,
                          (index) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: CategoryItem(
                          data: uniqueFiltered[index],isSelected: index == selectedIndex,
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                            onTypeChanged(uniqueFiltered[selectedIndex]);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                //Search Listed Here
                Container(
                  margin: EdgeInsets.only(right: 15, left: 15),
                  child: Column(
                    children: List.generate(
                      listedFiltered.length,
                          (index) => SearchItem(
                        data: listedFiltered[index],
                        onTapFavorite: () {
                          setState(() {
                            listedFiltered[index]["is_favorited"] =
                            !listedFiltered[index]["is_favorited"];
                          });
                        },
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailPage(index: index,)));
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                SizedBox(height: 20,),

                SizedBox(height: 100,),
              ]
          )
      );
  }
  onItemChanged(String value) {
    setState(() {
      fCatagorisedDataList.clear();
      features.forEach((element) {
          if (element["name"].toString().toLowerCase().contains(value.toLowerCase())||element["type"].toString().toLowerCase().contains(value.toLowerCase())) {
            newCatagorisedDataList.forEach((elements) {
              if(elements["type"]==element["type"]){
                fCatagorisedDataList.add(element);
              }
            });
          }
        });
    });
  }
  onTypeChanged(String value) {
    setState(() {
      fCatagorisedDataList.clear();
      newCatagorisedDataList.clear();
      if(value.toLowerCase()=="all"){
        value="";
        features.forEach((element) {
          if (element["type"].toString().toLowerCase().contains(value.toLowerCase())) {
            newCatagorisedDataList.add(element);
            fCatagorisedDataList.add(element);
          }
        });
      }
      else{
        features.forEach((element) {
          if (element["type"].toString().toLowerCase().contains(value.toLowerCase())) {
            newCatagorisedDataList.add(element);
            fCatagorisedDataList.add(element);
          }
        });
      }
    controller.clear();
    });
  }
}