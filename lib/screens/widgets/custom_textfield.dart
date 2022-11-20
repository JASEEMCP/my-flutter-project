import 'package:flutter/material.dart';
import 'package:shoppingapp/constants/constants.dart';
import 'package:shoppingapp/models/arguments.dart';

class CustomTextfield extends StatefulWidget {
  final IconData icon;
  final bool obscureText;
  final String hintText;


   CustomTextfield({
    Key ?key, required this.icon, required this.obscureText,
     required this.hintText,
  }) : super(key: key);

  @override

  State<CustomTextfield> createState() => CustomTextfieldState();
}

class CustomTextfieldState extends State<CustomTextfield> {
  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  List<EmailPwd> cText = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return
        TextField(


          controller: widget.obscureText?password:username,
          obscureText: widget.obscureText,
          style: TextStyle(
            color: Constants.blackColor,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(widget.icon, color: Constants.blackColor.withOpacity(.3),),
            hintText: widget.hintText,
          ),
          cursorColor: Constants.blackColor.withOpacity(.5),
        );


  }
}