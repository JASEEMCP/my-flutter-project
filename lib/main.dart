import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shoppingapp/screens/signin_page.dart';
import 'package:shoppingapp/screens/splash_screen.dart';
void main(){
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  const MaterialApp(
      title: 'ShopingApp',
      home: MyAppState(),
      debugShowCheckedModeBanner: false,

    );
  }
}
class MyAppState extends StatefulWidget {
  const MyAppState({super.key});

  @override
  State<MyAppState> createState() => _MyAppStateState();
}

class _MyAppStateState extends State<MyAppState> {
  @override
  void initState() {

    super.initState();
    Timer(const Duration(seconds: 3),()=>Navigator.pushReplacement(context,MaterialPageRoute(
        builder: (ctx)=> SignIn())
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
