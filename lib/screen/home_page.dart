import 'package:bookingapp/widgets/featured_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List locations = [
    "Phnom Penh",
    "Siem Reap",
    "Sihanoukville",
    "Battambang",
    "Mondulkiri",
    "Kampot",
    "Pursat",
    "Steung Treng"
  ];

  List featuredItems = [
    {"title": "Classic room", "type": "Queen Room", "price": 180},
    {"title": "Twin room", "type": "Double Room", "price": 190},
    {"title": "Luxury room", "type": "Queen Room", "price": 200},
    {"title": "King room", "type": "Single Room", "price": 240},
    {"title": "Queen room", "type": "Single Room", "price": 240},
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF7F7F7),
          flexibleSpace: FlexibleSpaceBar(
            background: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_history,
                    color: Colors.grey[600],
                  ),
                  Container(
                    width: 4,
                  ),
                  Text(
                    "Phnom Penh",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  )
                ],
              ),
            ),
          ),
          actions: [
            Stack(children: [
              Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.5, color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white),
                child: Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.grey[600],
                ),
              ),
              const Positioned(
                  top: 6,
                  right: 6,
                  child: Icon(Icons.brightness_1,
                      size: 10.0, color: Colors.redAccent)),
            ]),
            Container(
              width: 12,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Find and Book",
                style: TextStyle(
                    color: Colors.grey.shade500, fontWeight: FontWeight.w500),
              ),
              Text(
                "The Best Hotel Rooms",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                height: 48,
                width: double.infinity,
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(right: 2, bottom: 2, top: 2),
                  scrollDirection: Axis.horizontal,
                  physics: ClampingScrollPhysics(),
                  children: locations
                      .map((e) => Container(
                            child: Text(e),
                            margin: e != locations[locations.length - 1]
                                ? EdgeInsets.only(right: 10)
                                : EdgeInsets.only(right: 0),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.shade200),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        Colors.grey.shade400.withOpacity(0.55),
                                    spreadRadius: .5,
                                    blurRadius: .5,
                                    offset: Offset(
                                        1, 1), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10)),
                          ))
                      .toList(),
                ),
              ),
              Text(
                "Featured",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              Container(
                height: 8,
              ),
              Container(
                child: CarouselSlider(
                  items: featuredItems
                      .map((e) => FeaturedItem(
                            title: e["title"],
                            type: e["type"],
                            price: e["price"],
                          ))
                      .toList(),
                  options: CarouselOptions(
                      height: 260,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      enlargeCenterPage: true,
                      clipBehavior: Clip.none),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
