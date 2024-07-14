import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Hotel {
  final String imageUrl;
  final String title;
  final String location;
  final String price;
  final String city;
  final IconData icon;

  Hotel({
    required this.imageUrl,
    required this.title,
    required this.icon,
    required this.price,
    required this.location,
    required this.city,
  });
}

class HotelCard extends StatelessWidget {
  final Hotel product;
  HotelCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(product.imageUrl),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                product.price,
                maxLines: 1,
                style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DM Sans'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                product.title,
                maxLines: 1,
                style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DM Sans'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                product.location,
                maxLines: 1,
                style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DM Sans'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                product.city,
                maxLines: 1,
                style: const TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontFamily: 'DM Sans'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF01C000), // #01C000
                        Color(0xFF008101),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  padding: const EdgeInsets.all(6.0),
                  child: SvgPicture.asset(
                    'assets/icons/eye2.svg',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
