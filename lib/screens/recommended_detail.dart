import 'package:flutter/material.dart';
import '../utils/data.dart';
import '../widgets/detaildescription_item.dart';
import '/theme/color.dart';
import '/widgets/icon_box.dart';

class RecommendedDetailPage extends StatefulWidget {
  const RecommendedDetailPage({Key? key,required this.index}) : super(key: key);
  final int index;
  @override
  _RecommendedDetailPageState createState() => _RecommendedDetailPageState(index);
}

class _RecommendedDetailPageState extends State<RecommendedDetailPage> {
  int index;
  _RecommendedDetailPageState(this.index);
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
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //getImageDetail(),
            getDescriptionDetail(),
          ],
        )
    );
  }
  Widget getBottomBar() {

    return Container(
      height: 85,
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
              child: Icon(Icons.phone_outlined, color: Colors.white),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: darkerGreen,
                shape: CircleBorder(),
                fixedSize: Size.fromRadius(20),
              )),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
              child: Text('Book now',
                style: TextStyle(fontSize: 18, height: 1.5), ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(primary: primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                fixedSize: Size.fromWidth(250),

              ))
        ],
      ) ,
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
          data: recommends[widget.index],
          onTapFavorite: () {
            setState(() {
              recommends[widget.index]["is_favorited"] =
              !recommends[widget.index]["is_favorited"];
            });
          },
          onTap: () {},
        ),
        ),
      );
  }

}