import 'package:flutter/material.dart';

class CustomImageTile extends StatelessWidget {
  final String imageURL;
  final double angle;
  final double paddingLeft;
  final double paddingRight;
  final double size;
  const CustomImageTile(
      {super.key,
      required this.angle,
      required this.imageURL,
      required this.paddingLeft,
      required this.paddingRight,
      required this.size});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(top: 35, right: paddingRight, left: paddingLeft),
      child: Transform.rotate(
        angle: angle,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500/$imageURL"))),
          width: width * .35*size,
          height: width * .5*size,
        ),
      ),
    );
  }
}
