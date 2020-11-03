import 'dart:convert';
import 'package:dio/dio.dart';
import '../categories/model.dart';

class CategoriesController{

  Dio _dio =Dio();
  CategoriesModel _categoriesModel=CategoriesModel();

  Future<CategoriesModel> getNewsCats() async{
    var response = await _dio.get('https://association.rowadtqnee.sa/api/list/categories');
    var data = json.decode(response.toString());
    _categoriesModel =CategoriesModel.fromJson(data);
    return _categoriesModel;
  }

}