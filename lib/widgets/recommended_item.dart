import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommendedItem extends StatelessWidget {
  const RecommendedItem(
      {super.key,
      required this.title,
      required this.type,
      required this.price,
      required this.rate,
      required this.imageUrl});
  final String title;
  final String type;
  final int price;
  final double rate;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 0.5,
              spreadRadius: .5,
              offset: const Offset(0, 1),
            )
          ]),
      child: Stack(children: [
        Row(
          children: [
            Container(
              height: double.infinity,
              width: 120,
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  type,
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.grey.shade500),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Color(0xFFFF90BC),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      rate.toString(),
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          right: 4,
          child: Text(
            "\$${price}",
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xFFFF90BC)),
          ),
        )
      ]),
    );
  }
}
