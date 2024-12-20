import 'package:flutter/material.dart';
import 'package:untitled21/post_screen.dart';
import 'package:untitled21/utils/services/ap%C4%B1_services.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    ApiService apiService = ApiService();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'API EXAMPLE',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.deepPurpleAccent),
          ),
        ),
        body:FutureBuilder(
          future: apiService.getComments(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
             return  Stack(
               children: [
                 ListView.builder
                   (
                   itemCount: snapshot.data!.length!,
                   itemBuilder:(context, index) {
                     return Text(snapshot.data![index].id.toString());

                   }, ),
                 Align(
                     alignment: Alignment.bottomCenter,
                     child: ElevatedButton(onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>PostScreen()));
                     }, child: Text('Send Data ')))
               ]
             );
            }else {
            return Text('${snapshot.hasError}');
            }
            return const CircularProgressIndicator(

            );
          },
        )
      ),
    );
  }
}
