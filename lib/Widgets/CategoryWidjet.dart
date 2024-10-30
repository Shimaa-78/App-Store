import 'package:flutter/material.dart';
class CategoryWidjet extends StatelessWidget {
  CategoryWidjet({
    super.key,
    required this.icon,
    required this.categoryName,
  });

  final IconData icon;
  String categoryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.black,
      ),
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      height: 80,
      child: Row(

        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          SizedBox(width: 30,),
          Text(categoryName,style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}