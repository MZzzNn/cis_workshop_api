import 'package:flutter/material.dart';
import '../news/view.dart';
import '../categories/controller.dart';
import '../categories/model.dart';

class CategoriesView extends StatefulWidget {
  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  CategoriesController _newsController=CategoriesController();
  CategoriesModel _categoriesModel=CategoriesModel();
  bool loading =true;
  _getNews() async{
    _categoriesModel =await _newsController.getNewsCats();
    setState(() {
      loading=false;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getNews();
  }
  Widget _catCard({String image,String name,int index}){
    List<String> _splitedList= name.split(' ');
    String title =_splitedList[0];
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>NewsView()));
      },
      child: Container(
        height: 300,
        width: 100,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: index==0 ? Color(0xff304637) :Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image:NetworkImage(image),
            height: 55,width: 45),
            Expanded(child: SizedBox()),
            Text(title,style: TextStyle(
                fontSize: 18,fontWeight: FontWeight.bold,color: index==0 ?Colors.white :Colors.black)),
            Text(name.substring(title.length,name.length),style: TextStyle(
                fontSize: 13,fontWeight: FontWeight.bold,color: index==0 ?Colors.white :Colors.black),),
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
        appBar: appBar(title:'اقسام اللجنه',context: context ),
        body: loading==true?
        Container(color:Color(0xffF2F2F2),child: Center(child: CircularProgressIndicator(),)) :
        Container(
          color: Color(0xffF2F2F2),
          child: Padding(
            padding: const EdgeInsets.only(left:25.0,right: 25.0,top: 15.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2 ,
                crossAxisSpacing:15 ,
                mainAxisSpacing: 15,
                childAspectRatio: 0.8,
              ),
              itemCount:_categoriesModel.data.length,
              itemBuilder:(ctx,index){return _catCard(
                image: _categoriesModel.data[_categoriesModel.data.length-(index+1)].image,
                name:_categoriesModel.data[_categoriesModel.data.length-(index+1)].name,
                index:index,
              );} ,
            ),
          ),
        ),

      ),
    );
  }
}
Widget appBar({String title,BuildContext context}){
  return  AppBar(
    backgroundColor: Color(0xffF2F2F2),
    elevation: 0.0,
    title: Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
    leading: Padding(
      padding: const EdgeInsets.only(right:20.0,top: 10,bottom: 10,left: 0),
      child: InkWell(
        onTap: (){Navigator.pop(context);},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffE9DDC9),
          ),
          child: Icon(Icons.arrow_back_ios,color: Color(0xffD7B67C),),
        ),
      ),
    ),
  );
}