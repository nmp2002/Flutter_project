import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      ),
    );
  }
}
