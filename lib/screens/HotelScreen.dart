import 'package:flutter/material.dart';

import '../widgets/hotel_card.dart';

class HotelScreen extends StatelessWidget {
  final List<Hotel> hotels;
  final String cityName;

  HotelScreen({required this.hotels, required this.cityName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          cityName,
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF008101),
                Color(0xFF01C000),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          return HotelCard(product: hotels[index]);
        },
      ),
    );
  }
}
