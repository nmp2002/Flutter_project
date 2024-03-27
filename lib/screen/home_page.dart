import 'package:bookingapp/widgets/featured_item.dart';
import 'package:bookingapp/widgets/recommended_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'detail.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List locations = [
    "Sofitel Legend Metropole",
    "Movenpick",
    "Melia",
    "The Oriental Jade",
    "Hilton Hà Nội Opera",
    "Sheraton Hà Nội",
    "Elegant Suites Westlake",
    "Pan Pacific"
  ];

  List roomItems = [
    {
      "title": "Classic room",
      "type": "Queen Room",
      "price": 180,
      "rate": 4.0,
      "imageUrl":
          "https://img.freepik.com/free-photo/luxury-classic-modern-bedroom-suite-hotel_105762-1787.jpg"
    },
    {
      "title": "Twin room",
      "type": "Double Room",
      "price": 190,
      "rate": 4.1,
      "imageUrl":
          "https://www.navadahotel.com/FileStorage/Room/Thumbnail/DSC_2755-HDR.jpg",
    },
    {
      "title": "Luxury room",
      "type": "Queen Room",
      "price": 200,
      "rate": 4.2,
      "imageUrl":
          "https://noithattrevietnam.com/uploaded/2019/12/3-thiet-ke-phong-ngu-khach-san-mini%20%285%29.jpg"
    },
    {
      "title": "King room",
      "type": "Single Room",
      "price": 240,
      "rate": 4.3,
      "imageUrl":
          "https://anviethouse.vn/wp-content/uploads/2021/12/Thiet-ke-phong-deluxe-khach-san-1-2.jpg"
    },
    {
      "title": "Queen room",
      "type": "Single Room",
      "price": 240,
      "rate": 4.5,
      "imageUrl":
          "https://queenannnhatrang.com//uploads/Roooms/slide-cover-premier-double%20(1).jpg"
    },
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
                    "Hà Nội",
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
                "Tìm và đặt",
                style: TextStyle(
                    color: Colors.grey.shade500, fontWeight: FontWeight.w500),
              ),
              const Text(
                "Những phòng khách sạn tốt nhất",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                height: 48,
                width: double.infinity,
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(right: 2, bottom: 2, top: 2),
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  children: locations
                      .map((e) => Container(
                            child: Text(e),
                            margin: e != locations[locations.length - 1]
                                ? const EdgeInsets.only(right: 10)
                                : const EdgeInsets.only(right: 0),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.shade200),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        Colors.grey.shade400.withOpacity(0.55),
                                    spreadRadius: .5,
                                    blurRadius: .5,
                                    offset: const Offset(
                                        1, 1), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10)),
                          ))
                      .toList(),
                ),
              ),
              const Text(
                "Đặc sắc",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              Container(
                height: 8,
              ),
              CarouselSlider(
                items: roomItems
                    .map((e) => FeaturedItem(
                          title: e["title"],
                          type: e["type"],
                          price: e["price"],
                          imageUrl: e["imageUrl"],
                        ))
                    .toList(),
                options: CarouselOptions(
                    height: 260,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    enlargeCenterPage: true,
                    clipBehavior: Clip.none),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    "Đề xuất cho bạn",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Text(
                    "Xem tất cả",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade600),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                height: 96,
                width: double.infinity,
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(bottom: 4),
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  children: roomItems
                      .map((e) => GestureDetector(
                            onTap: () {
                              // Chuyển đổi Map thành đối tượng Room nếu cần
                              Room room = Room(
                                title: e["title"],
                                type: e["type"],
                                price: e["price"],
                                rate: e["rate"],
                                imageUrl: e["imageUrl"],
                              );
                              // Điều hướng đến trang detail.dart khi một RecommendedItem được nhấn
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RoomDetailScreen(
                                    room: room, // Truyền thông tin phòng
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              margin: e != roomItems.last
                                  ? const EdgeInsets.only(right: 12)
                                  : const EdgeInsets.only(right: 0),
                              child: RecommendedItem(
                                title: e["title"],
                                type: e["type"],
                                price: e["price"],
                                rate: e["rate"],
                                imageUrl: e["imageUrl"],
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
