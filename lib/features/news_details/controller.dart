import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:task8_3lir/features/news_details/model.dart';

class NewDetailsController{
  Dio _dio =Dio();
  NewsDetailsModel _newsDetailsModel=NewsDetailsModel();
  Future getNewDetails({int id}) async{
    var response= await _dio.get('https://association.rowadtqnee.sa/api/lastNews/${id}');
    var data= json.decode(response.toString());
    _newsDetailsModel =NewsDetailsModel.fromJson(data);
    return _newsDetailsModel;
  }
}