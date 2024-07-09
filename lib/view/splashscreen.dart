import 'package:flutter/material.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:<Widget> [
          
          Image.network(
            height:300,
            width:MediaQuery.of(context).size.width,
            "https://imgflip.com/s/meme/Doge.jpg"),
          SizedBox(height: 50,),
          Text("Meme Generator",style: TextStyle(fontSize: 40,fontWeight:FontWeight.bold ,fontFamily: "Poppins"),),

        ],),
      ),
    );
  }
}
