import 'package:flutter/material.dart';
import 'package:nike_project/Utilits/constants/colorConstants.dart';

class whitebutton extends StatefulWidget {
   final String text;
  const whitebutton({
    super.key,
    required this.text,
  });

  @override
  State<whitebutton> createState() => _whitebuttonState();
}

class _whitebuttonState extends State<whitebutton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 19,vertical: 6),
      width: 153,
      height: 43,
      decoration: BoxDecoration(
        color: Colorconstants.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(child: Text(widget.text,style: TextStyle(fontSize: 20,color: Colorconstants.primaryblue),)),
    );
  }
}
