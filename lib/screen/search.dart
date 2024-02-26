import 'package:flutter/material.dart';

class AppColor {
  static const Color appBgColor = Colors.white;
  static const Color appBarColor = Colors.blue;
  static const Color textColor = Colors.black;
  static const Color orange = Colors.orange;
  static const Color blue = Colors.blue;
  static const Color red = Colors.red;
  static const Color green = Colors.green;
  static const Color labelColor = Colors.grey;
  static const Color actionColor = Colors.red; // Change to your desired color
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColor.appBarColor,
            pinned: true,
            snap: true,
            floating: true,
          ),
          SliverToBoxAdapter(
            child: HotelSearchPage(),
          ),
        ],
      ),
    );
  }
}

class HotelSearchPage extends StatefulWidget {
  @override
  _HotelSearchPageState createState() => _HotelSearchPageState();
}

class _HotelSearchPageState extends State<HotelSearchPage> {
  TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> roomItems = [
    {
      "title": "Classic room",
      "type": "Queen Room",
      "price": 180,
      "rate": 4.6,
      "reviews": 120,
      "imageUrl":
          "https://noithattrevietnam.com/uploaded/2019/12/3-thiet-ke-phong-ngu-khach-san-mini%20%285%29.jpg",
    },
    {
      "title": "Classic room",
      "type": "Queen Room",
      "price": 180,
      "rate": 4.8,
      "reviews": 124,
      "imageUrl":
          "https://queenannnhatrang.com//uploads/Roooms/slide-cover-premier-double%20(1).jpg",
    },
    // ... (add more room items)
  ];

  List<Map<String, dynamic>> getSpecialRooms() {
    return roomItems
        .where((room) => room['rate'] >= 4.5 && room['reviews'] >= 100)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> specialRooms = getSpecialRooms();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://www.hoteljob.vn/files/quang-ba-khach-san.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Find and Book",
            style: TextStyle(
              color: AppColor.textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Text(
            "The Best Hotel Rooms",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search for hotels...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                // Perform search or filtering based on the entered text.
                // You may want to update the displayed items accordingly.
              },
            ),
          ),
          if (specialRooms.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  "Special Rooms with High Ratings",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                // Display special room cards
                for (final specialRoom in specialRooms)
                  HotelCard(
                    title: specialRoom["title"],
                    type: specialRoom["type"],
                    price: specialRoom["price"],
                    rate: specialRoom["rate"],
                    reviews: specialRoom["reviews"],
                    imageUrl: specialRoom["imageUrl"],
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final String title;
  final String type;
  final int price;
  final double rate;
  final int reviews;
  final String imageUrl;

  const HotelCard({
    Key? key,
    required this.title,
    required this.type,
    required this.price,
    required this.rate,
    required this.reviews,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            width: double.infinity,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Handle the like button press
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: Color.fromARGB(255, 249, 133, 204),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  type,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$$price/night",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 245, 129, 218),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: Color.fromARGB(255, 243, 107, 213)),
                        Text(rate.toString()),
                        const SizedBox(width: 4),
                        const Icon(Icons.comment,
                            color: Color.fromARGB(255, 24, 65, 66)),
                        Text(reviews.toString()),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
