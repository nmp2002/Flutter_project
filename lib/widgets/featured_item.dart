import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FeaturedItem extends StatefulWidget {
  const FeaturedItem(
      {super.key,
      required this.title,
      required this.type,
      required this.price});
  final String title;
  final String type;
  final int price;

  @override
  State<FeaturedItem> createState() => _FeaturedItemState();
}

class _FeaturedItemState extends State<FeaturedItem> {
  bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.shade400,
          blurRadius: 0.5,
          spreadRadius: .5,
          offset: const Offset(0, 1),
        )
      ], borderRadius: BorderRadius.circular(16), color: Colors.white),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.network(
                    'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(widget.type),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "\$${widget.price}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0xFFFF90BC)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: _isFavorited ? const Color(0xFFf77080) : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: _isFavorited
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.favorite_outline,
                        color: Color(0xFFFF90BC),
                      ),
              ),
              onTap: () {
                setState(() {
                  _isFavorited = !_isFavorited;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
