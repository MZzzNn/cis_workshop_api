import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../categories/view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
    const StaggeredTile.count(2, 1),
    const StaggeredTile.count(1, 1.6),
    const StaggeredTile.count(1, 1.2),
    const StaggeredTile.count(1, 1.6),
    const StaggeredTile.count(1, 1.2),
  ];
  List<Map<String,dynamic>> homeData=[
    {
      'title':'اقسام اللجنه',
      'image':'images/image1.png',
      'icon':'images/logoi1.png',
    },

    {
      'title':'تطوع معنا',
      'image':'images/image2.png',
      'icon':'images/logoi5.png',
    },
    {
      'title':'الاخبار',
      'image':'images/image3.png',
      'icon':'images/logoi3.png',
    },
    {
      'title':'المسابقه',
      'image':'images/image5.png',
      'icon':'images/logoi5.png',
    },
    {
      'title':'المزيد',
      'image':'images/image4.png',
      'icon':'images/logoi3.png',
    },
  ];
  Widget _homeCard({String image,String title,String icon}){
    return  InkWell(
      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CategoriesView())),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xff304637).withOpacity(0.75),
                borderRadius: BorderRadius.circular(20)),
          ),
          Positioned(
              top: 0,
              right: -15,
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(icon))),
              )),
          Positioned(
              bottom: 20,
              right: 15,
              child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffF2F2F2),
          elevation: 0,
          title: Text(
            'الرئيسيه',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 8, bottom: 10),
              child: Image.asset(
                'images/logo.png',
              ),
            )
          ],
        ),
        body: Container(
          color: Color(0xffF2F2F2),
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
            child: Column(
              children: [
                Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15.0,
                        crossAxisSpacing: 15.0,
                        itemCount: homeData.length,
                        staggeredTileBuilder: (int index) => _staggeredTiles[index],
                        itemBuilder: (BuildContext context, int index) => _homeCard(
                          image: homeData[index]['image'],
                          title: homeData[index]['title'],
                          icon: homeData[index]['icon'],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

