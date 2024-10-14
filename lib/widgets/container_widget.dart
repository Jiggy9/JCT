import 'dart:ui';

import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget(
      {super.key,
      required this.cardImage,
      required this.cardText,
      required this.onSelectGrid,
      required this.cardTextColor});
  final String cardImage;
  final String cardText;
  final Color cardTextColor;
  final void Function() onSelectGrid;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 400,
            width: 350,
            decoration: BoxDecoration(
                // color: Colors.pink,
                borderRadius: BorderRadius.circular(22.0),
                image: DecorationImage(image: AssetImage(cardImage))),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.0),
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.red.withOpacity(0.48)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),

          // button
          Positioned(
              bottom: 15,
              // right: 0,
              child:
                  buildGradientButton(cardText, cardTextColor, onSelectGrid)),
        ],
      ),
    );
  }
}

Widget buildGradientButton(
    String text, Color fontColor, void Function() onSelectGrid) {
  return InkWell(
    onTap: onSelectGrid,
    child: Stack(alignment: Alignment.center, children: [
      // blur effect
      ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            height: 50,
            width: 300,
            // constraints: BoxConstraints(minHeight: 50, minWidth: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white.withOpacity(0.2),
            ),
          ),
        ),
      ),
      // button here
      Container(
        // padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        // constraints: BoxConstraints(minHeight: 50, minWidth: 300),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        height: 50, width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(colors: [
              Colors.purpleAccent.withOpacity(0.2),
              Colors.red.withOpacity(0.2),
              Colors.pink.withOpacity(0.4)
            ])),
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: fontColor, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    ]),
  );
}
