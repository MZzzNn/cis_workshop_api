import 'package:flutter/material.dart';
import 'package:task8_3lir/features/news/controller.dart';
import 'package:task8_3lir/features/news/model.dart';
import 'package:task8_3lir/features/news_details/view.dart';
import '../categories/view.dart';

class NewsView extends StatefulWidget {
  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  NewsModel _newsModel=NewsModel();
  NewsController _newsController=NewsController();
  bool loading=true;

  getNews() async{
    _newsModel =await _newsController.getNews();
    setState(() {
      loading=false;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }
  Widget _newsCard({String image,String title,String date,int id}){
    return Padding(
      padding: const EdgeInsets.only(top:16.0),
      child: InkWell(
        onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>NewDetails(id:id ,)));},
        child: Stack(
          children: [
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: NetworkImage(image)),
                borderRadius: BorderRadius.circular(20)
              ),
            ),
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20)
              ),
            ),
            Positioned(
              bottom: 35,
              right: 12,
                child: Text(title,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)
            ),
            Positioned(
                bottom: 12,
                right: 12,
                child: Text(date,style: TextStyle(color: Color(0xffD1D1D1),fontSize: 12),)
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: appBar(title: 'اخبار اللجنه',context: context ),
        body: loading==true?
        Container(color:Color(0xffF2F2F2),child: Center(child: CircularProgressIndicator(),)) :
        Container(
          color: Color(0xffF2F2F2),
          child: Padding(
            padding: const EdgeInsets.only(left:25.0,right: 25.0,top: 15.0),
            child: ListView.builder(
                itemCount: _newsModel.data.length,
                itemBuilder: (ctx,index)=>_newsCard(
                  title: _newsModel.data[_newsModel.data.length-(index+1)].title,
                  date: _newsModel.data[_newsModel.data.length-(index+1)].createAt,
                  image: _newsModel.data[_newsModel.data.length-(index+1)].image,
                  id: _newsModel.data[_newsModel.data.length-(index+1)].id,
                )),
          ),
        ),

      ),
    );

  }
}

