import 'package:flutter/material.dart';
import 'home_page.dart';

class RoomDetailScreen extends StatelessWidget {
  final Room room;

  RoomDetailScreen({required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildRoomImage(room.imageUrl),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('Room Name', room.title),
                  _buildDetailRow('Type', room.type),
                  _buildDetailRow('Price', '\$${room.price.toString()}'),
                  _buildDetailRow('Rate', room.rate.toString()),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Hành động khi nhấn nút "Book Now"
                        },
                        child: Text('Book Now'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Hành động khi nhấn nút "Call"
                        },
                        child: Text('Call'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (title == 'Rate') // Thêm điều kiện để tạo khung cho phần rate
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 16,
                  ),
                  SizedBox(width: 4),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          if (title != 'Rate') // Hiển thị thông tin khác mà không có khung
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRoomImage(String imageUrl) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class Room {
  final String title;
  final String type;
  final double price;
  final double rate;
  final String imageUrl;

  Room({
    required this.title,
    required this.type,
    required this.price,
    required this.rate,
    required this.imageUrl,
  });
}
