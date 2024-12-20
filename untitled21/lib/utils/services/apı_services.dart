import 'dart:convert';

import 'package:untitled21/utils/constant/ap%C4%B1_constant.dart';
import 'package:untitled21/utils/models/comments_model.dart';
import 'package:http/http.dart'as http ;

  class ApiService {
    Future<List<CommentsModel>> getComments() async {

      final response = await http.get(Uri.parse(url));
      print(response.statusCode);
      List<CommentsModel> comments = [];
      List<dynamic> responseList = jsonDecode(response.body);

      for(var i=0; i<responseList.length; i++ ){
        comments.add(CommentsModel.fromJson(responseList[i]));

      }
      return  comments;


    }
    Future<http.Response> postComment(CommentsModel model ) async{
        final response = await http.post(Uri.parse(url),
        headers: <String,String>{
          'Content -Type' :'application/json ; charset=UTF-8',

        },
          body: jsonEncode(model.toJson())
        );

        return response;
    }

}