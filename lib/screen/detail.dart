import 'package:flutter/material.dart';
import 'home_page.dart';
import 'booking.dart'; // Import booking.dart
import 'booking.dart';

class RoomDetailScreen extends StatelessWidget {
  final Room room;

  RoomDetailScreen({required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Details'),
        // Add padding for AppBar
        elevation: 0, // Remove shadow
        backgroundColor: Colors.white, // White background
        iconTheme: IconThemeData(
          color: Colors.black87, // Black icons
        ),
        centerTitle: true,
        // End padding for AppBar
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
                  Divider(), // Add divider between details
                  _buildDetailRow('Type', room.type),
                  Divider(), // Add divider between details
                  _buildDetailRow('Price', '\$${room.price.toString()}'),
                  Divider(), // Add divider between details
                  _buildDetailRow('Rate', room.rate.toString()),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _showConfirmationDialog(context,
                              'You are about to book ${room.title}. Please confirm your booking.');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(
                              255, 237, 233, 235), // Change button color
                        ),
                        child: Text('Book Now'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _showCallDialog(context, '123456789');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(
                              255, 237, 233, 235), // Change button color
                        ),
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
          if (title == 'Rate') // Condition to create frame for rate
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
          if (title != 'Rate') // Display other info without frame
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

  void _showConfirmationDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Perform booking action here
                Navigator.of(context).pop(); // Close the dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BookingScreen(room: room)),
                );
              },
              child: Text('Confirm'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showCallDialog(BuildContext context, String phoneNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Call'),
          content: Text('Do you want to call $phoneNumber?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Perform call action here
                Navigator.of(context).pop();
              },
              child: Text('Call'),
            ),
          ],
        );
      },
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
