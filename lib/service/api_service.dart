

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/Models.dart';

class HttpService{
  final String apikey = '510fdeb2c28e260a0448274ee0322b12';
  final String trendingWeekUrl= 'https://api.themoviedb.org/3/trending/movie/week?api_key=';


    getTrending()async{

      var url = Uri.parse(trendingWeekUrl+apikey);
      var response = await get(url);
      if (response.statusCode == 200){
        debugPrint("${ modelFromJson(response.body).results?[0].backdropPath}");
        return modelFromJson(response.body);
    }else{
        return Model();
      }

  }

}