import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled21/utils/models/comments_model.dart';
import 'package:untitled21/utils/services/ap%C4%B1_services.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  TextEditingController postIdController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Screen'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Text('Post ID : ')),
              Expanded(child: TextField(
                controller: postIdController,
              )
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Text(' ID : ')),
              Expanded(child: TextField(
                controller: idController,
              )
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Text(' Name : ')),
              Expanded(child: TextField(
                controller: nameController,
              )
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Text('Email : ')),
              Expanded(child: TextField(
                controller: emailController,
              )
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Text('Body : ')),
              Expanded(child: TextField(
                controller: bodyController,
              )
              ),
            ],
          ),
          SizedBox(height: 15,),
          ElevatedButton(onPressed: () {

          }, child: Text('Send!'))
        ],
      )
    );
  }
  void SendData ()async{
    CommentsModel model =CommentsModel(
      postId: int.parse(postIdController.text),
        name:nameController.text,
      body: bodyController.text,
      email: emailController.text,
      id: int.parse(idController.text),
    );
    final res = await _apiService.postComment(model);
    if(res.statusCode == HttpStatus.created){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('BAŞARILI'))
      );
      Navigator.pop(context);
    }

  }

}

