import 'package:flutter/material.dart';

class SearchHome extends StatelessWidget {
  const SearchHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),

      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: const TextStyle(color: Colors.grey),
          //enabled: false,
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        validator: (value){
          if(value!.isEmpty){
            return "Can't be empty";
          }
        },
      ),
    );
  }
}
