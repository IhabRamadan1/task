import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task/models/home_group.dart';
import 'package:task/models/jobs_by_group_id.dart';


Widget BuildGroupItem(context, DataHomeModel model )
{
  return Container(
    height: MediaQuery.of(context).size.height * 0.2,
    width: MediaQuery.of(context).size.width * 0.45,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 0.5,
          blurRadius: 0.5,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Padding(
      padding:  EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.01,
        horizontal: MediaQuery.of(context).size.width * 0.01,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
          image:NetworkImage("${model.image}"),
            fit: BoxFit.cover,
            height: 60,
            width: 60,
          ),
          Text(
              "${model.title}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15
            ),
          ),
          Text(
              "${model.jobs} jobs",
            style: TextStyle(
              color: Colors.green,
              fontSize: 12
            ),

          ),
          Text(
            "${model.employers} employers",
            style: TextStyle(
              color: Colors.grey,
                fontSize: 12
            ),

          ),
          Text(
            "${model.employees} employees",
            style: TextStyle(
              color: Colors.grey,
                fontSize: 12
            ),

          ),
        ],
      ),
    ),
  );
}

Widget BuildJobItem(context, Data model)
{
  if(model.id ==1){
  return Container(
    height: MediaQuery.of(context).size.height * 0.3,
    width: MediaQuery.of(context).size.width * 0.4,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 0.5,
          blurRadius: 0.5,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Padding(
      padding:  EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.01,
        horizontal: MediaQuery.of(context).size.width * 0.06,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${model.company}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: HexColor("#000080"),
                ),
                overflow: TextOverflow.ellipsis,
              ),
               Image(
                image:NetworkImage("${model.companyLogo}"),
                fit: BoxFit.cover,
                height: 60,
                width: 60,
              ),
            ],
          ),
          Text(
            "${model.jobSpecialist}",
            style: TextStyle(
                color: HexColor("#000080"),
                fontSize: 15
            ),

          ),
          Text(
            "${model.country}",
            style: TextStyle(
                color: HexColor("#000080"),
                fontSize: 12
            ),

          ),
           Text(
            "${model.createdAt}",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 12
            ),

          ),
        ],
      ),
    ),
  );}
  else{
    return Container(child: Text("No Jobs Available!"));
  }
}



