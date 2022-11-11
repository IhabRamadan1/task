import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task/models/country_with_city.dart';
import 'package:task/models/filter_jobs.dart';
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
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(
            image:NetworkImage("${model.image}"),
              fit: BoxFit.cover,
              height: 60,
              width: 60,
            ),
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

Widget BuildJobByIdItem(context, Data model)
{
  return Container(
    height: MediaQuery.of(context).size.height * 0.3,
    width: MediaQuery.of(context).size.width * 0.5,
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
        horizontal: MediaQuery.of(context).size.width * 0.05,
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
               Card(
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.all(
                     Radius.circular(25.0),
                   ),
                 ),
                 clipBehavior: Clip.antiAliasWithSaveLayer,
                 child: Image(
                  image:NetworkImage("${model.companyLogo}"),
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
              ),
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
  );
}

Widget BuildJobByCountryItem(context, DataModel model)
{
  return Container(
    height: MediaQuery.of(context).size.height * 0.3,
    width: MediaQuery.of(context).size.width * 0.5,
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
        horizontal: MediaQuery.of(context).size.width * 0.05,
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
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image(
                  image:NetworkImage("${model.companyLogo}"),
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
                ),
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
  );
}

Widget BuildCountryItem( BuildContext context, CountriesModel model)
{

  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[300],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0.5,
            blurRadius: 0.5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Text(
          "${model.name}",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}


