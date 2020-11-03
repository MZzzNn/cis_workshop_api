import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task8_3lir/features/news_details/controller.dart';
import 'package:task8_3lir/features/news_details/model.dart';

class NewDetails extends StatefulWidget {
  NewDetails({this.id});
  final int id;
  @override
  _NewDetailsState createState() => _NewDetailsState();
}

class _NewDetailsState extends State<NewDetails> {
  bool loading=true;
  NewDetailsController _newDetailsController=NewDetailsController();
  NewsDetailsModel _newsDetailsModel=NewsDetailsModel();
  getNewsDetails()async{
    _newsDetailsModel=await _newDetailsController.getNewDetails(id: widget.id);
    setState(() {
      loading=false;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsDetails();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:loading==true?
      Container(color:Color(0xffF2F2F2),child: Center(child: CircularProgressIndicator(),)) :
       Column(
        children: [
          Container(
            height: 280,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(image:
              NetworkImage(_newsDetailsModel.data.image),
                fit: BoxFit.cover
              ),
              color: Colors.red,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
              )
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 50,
                    right: 25,
                    child: InkWell(
                      onTap: (){Navigator.pop(context);},
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Icon(Icons.arrow_forward_ios,color: Color(0xffDABA81),),
                      ),
                    ),
                ),
                Positioned(
                    bottom: 14,
                    left: 21,
                    child:Row(
                      children: [
                        Icon(FontAwesomeIcons.share,size: 18,color: Colors.white,),
                        SizedBox(width: 15,),
                        Icon(Icons.visibility,size: 16,color: Colors.white,),
                        SizedBox(width: 5,),
                        Text('${_newsDetailsModel.data.views}',style: TextStyle(color: Colors.white),)
                      ],
                    )
                ),
              ],
            ),
          ),
          Directionality(
            textDirection:TextDirection.rtl,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_newsDetailsModel.data.title,style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                    SizedBox(height: 10,),
                    Text(_newsDetailsModel.data.createAt,style: TextStyle(fontSize: 12,color: Color(0xffA2A5A9)),),
                    SizedBox(height: 16,),
                    Text(_newsDetailsModel.data.desc,
                    style: TextStyle(fontSize: 16),)
                  ],
              ),
            ),
          )

        ],
      ),
    );
  }
}

