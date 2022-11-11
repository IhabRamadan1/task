import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class RowOfText extends StatelessWidget {
  const RowOfText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Recommended Groups",
          style: TextStyle(
              color: HexColor("#45C5BD"),
              fontWeight: FontWeight.bold
          ),
        ),
        Text(
          " Views All",
          style: TextStyle(
              color: HexColor("#000080"),
              fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}
