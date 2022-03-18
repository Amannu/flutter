import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/data.dart';
import '../widgets/detaildescription_item.dart';
import '/theme/color.dart';
import '/widgets/icon_box.dart';

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
        extendBodyBehindAppBar:true,
        backgroundColor: appBgColor,
        bottomNavigationBar: getBottomBar(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
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
        ),
        body:
        CustomScrollView(
          slivers: [SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) => buildBody(context),
                childCount: 1,
              ),
            )
          ],
        ));
  }


  Widget buildBody(BuildContext context){
    return SingleChildScrollView(
        child:
            //getImageDetail(),
            getDescriptionDetail(),

    );
  }
  Widget getBottomBar() {
    return Container(
      height: 75,
      width: double.infinity,
      child:Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          bottom: 15,
        ),
      child: Row(
        children: [
         IconBox(child: SvgPicture.asset(
            "assets/icons/call.svg",
            color: Colors.white,
          ), bgColor: green),
          SizedBox(
            width: 15,
          ),
          ElevatedButton(
              child: Text('Book now', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600), ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(primary: primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                fixedSize: Size.fromWidth(279),

              ))
        ],
      ) ,),
    );
  }
  /**getImageDetail() {
    return
      CarouselSlider(
        options: CarouselOptions(
          height: 300,
          viewportFraction: 1,
          disableCenter: true,
        ),
        items: List.generate(
          features.length,
              (index) => DetailImageItem(
            data: features[index],
            onTapFavorite: () {
              setState(() {
                features[index]["is_favorited"] =
                !features[index]["is_favorited"];
              });},
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailPage(index: index,)));
            },
          ),
          ),
      );
  }
**/
  getDescriptionDetail() {
    return
      Column(
        children: List.generate(
          1,(index) => DetailDescriptionItem(
          index: widget.index,
            data: features[widget.index],
            onTapFavorite: () {
              setState(() {
                features[widget.index]["is_favorited"] =
                !features[widget.index]["is_favorited"];
              });
            },
            onTap: () {},
          ),
        ),
      );
  }
}