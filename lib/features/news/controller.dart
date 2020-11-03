import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:task8_3lir/features/news/model.dart';

class NewsController{
  Dio _dio =Dio();
  NewsModel _newsModel=NewsModel();
  
  Future<NewsModel> getNews()async{
    var response =await _dio.get('https://association.rowadtqnee.sa/api/lastNews');
    var data= json.decode(response.toString());
    _newsModel =NewsModel.fromJson(data);
    return _newsModel;
  }
}