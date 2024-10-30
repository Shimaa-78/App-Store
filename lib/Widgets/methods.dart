import 'package:flutter/material.dart';
AppBar buildAppBar(BuildContext context) {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: CircleAvatar(
          // radius: 20,
          backgroundColor: Colors.black,
          child: Icon(Icons.arrow_back_sharp,color: Colors.white,),
        ),
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Icon(Icons.search ,color: Colors.black,size: 30,),
      )
    ],
  );
}