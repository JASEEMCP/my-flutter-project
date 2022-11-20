import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
   Size sizer = MediaQuery.of(context).size;
   return  Scaffold(
     body: Center(

       child: Container(
           height: sizer.height,
           width: sizer.width,
           color: Colors.white,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Expanded(
                child: const Padding(padding: EdgeInsets.all(30),
                 child: Text("ShopNow",style: TextStyle(color: Colors.purple,fontSize: 30,fontWeight: FontWeight.bold),),
                 ),
              ),
               Padding(
                 padding: const EdgeInsets.all(20),
                 child: Image.asset("lib/assets/shopping-cart.png",
                     width: sizer.width*0.5,height: sizer.width*0.5,
                 fit: BoxFit.cover,),
               ),

             ],
           ),
       ),
     ),
   );
  }
}