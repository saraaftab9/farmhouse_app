import 'package:carousel_slider/carousel_slider.dart';
import 'package:farmhouse_app/screens/HotelScreen.dart';
import 'package:farmhouse_app/widgets/hotel_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;

  final Map<String, List<Hotel>> cityHotels = {
    'Karachi': [
      Hotel(
        imageUrl: 'images/hotel.png',
        title: 'Karachi Hotel 1',
        price: '5000 pkr/ night',
        location: 'Location 1, Karachi, Pakistan',
        city: 'Karachi',
        icon: Icons.lock_outline,
      ),
      Hotel(
        imageUrl: 'images/hotel.png',
        title: 'Karachi Hotel 2',
        price: '5500 pkr/ night',
        location: 'Location 2, Karachi, Pakistan',
        city: 'Karachi',
        icon: Icons.lock_outline,
      ),
    ],
    'Islamabad': [
      Hotel(
        imageUrl: 'images/hotel.png',
        title: 'Islamabad Hotel 1',
        price: '6000 pkr/ night',
        location: 'Location 1, Islamabad, Pakistan',
        city: 'Islamabad',
        icon: Icons.lock_outline,
      ),
      Hotel(
        imageUrl: 'images/hotel.png',
        title: 'Islamabad Hotel 2',
        price: '6500 pkr/ night',
        location: 'Location 2, Islamabad, Pakistan',
        city: 'Islamabad',
        icon: Icons.lock_outline,
      ),
    ],
    'Lahore': [
      Hotel(
        imageUrl: 'images/hotel.png',
        title: 'Lahore Hotel 1',
        price: '7000 pkr/ night',
        location: 'Location 1, Lahore, Pakistan',
        city: 'Lahore',
        icon: Icons.lock_outline,
      ),
      Hotel(
        imageUrl: 'images/hotel.png',
        title: 'Lahore Hotel 2',
        price: '7500 pkr/ night',
        location: 'Location 2, Lahore, Pakistan',
        city: 'Lahore',
        icon: Icons.lock_outline,
      ),
    ],
    'Peshawar': [
      Hotel(
        imageUrl: 'images/hotel.png',
        title: 'Peshawar Hotel 1',
        price: '8000 pkr/ night',
        location: 'Location 1, Peshawar, Pakistan',
        city: 'Peshawar',
        icon: Icons.lock_outline,
      ),
      Hotel(
        imageUrl: 'images/hotel.png',
        title: 'Peshawar Hotel 2',
        price: '8500 pkr/ night',
        location: 'Location 2, Peshawar, Pakistan',
        city: 'Peshawar',
        icon: Icons.lock_outline,
      ),
    ],
  };

  List<Cities> cities = [
    Cities(
      imageUrl: 'images/karachi.jpeg',
      title: 'Karachi',
    ),
    Cities(
      imageUrl: 'images/isb.jpeg',
      title: 'Islamabad',
    ),
    Cities(
      imageUrl: 'images/lhr.jpeg',
      title: 'Lahore',
    ),
    Cities(
      imageUrl: 'images/pesh.jpeg',
      title: 'Peshawar',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final totalPages = 4;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 180.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                ),
                items: [
                  Container(
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('images/img.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('images/img.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('images/img.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('images/img.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              DotsIndicator(currentPage: _currentPage, totalPages: totalPages),
              const SizedBox(height: 30),
              Container(
                height: 58,
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF008101),
                      Color(0xFF01C000),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: Center(
                  child: Text(
                    'Book with Ease, Stay with Joy',
                    style: TextStyle(
                      fontFamily: "Aclonica",
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Cities',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          'View all',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.grey,
                          size: 14,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 185,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cities.length,
                  itemBuilder: (context, index) {
                    return CitiesCard(
                      product: cities[index],
                      hotels: cityHotels[cities[index].title] ?? [],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Most Visited',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          'View all',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.grey,
                          size: 14,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 225,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: cityHotels.length,
                  itemBuilder: (context, index) {
                    String city = cityHotels.keys.elementAt(index);

                    return Column(
                      children: cityHotels[city]!
                          .map((hotel) => HotelCard(product: hotel))
                          .toList(),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Cities {
  final String imageUrl;
  final String title;

  Cities({
    required this.imageUrl,
    required this.title,
  });
}

class CitiesCard extends StatelessWidget {
  final Cities product;
  final List<Hotel> hotels;

  CitiesCard({required this.product, required this.hotels});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelScreen(
              hotels: hotels,
              cityName: product.title,
            ),
          ),
        );
      },
      child: Container(
        width: 170,
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
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(product.imageUrl),
                      fit: BoxFit.fill,
                    ),
                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}

class DotsIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  DotsIndicator({required this.currentPage, required this.totalPages});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: currentPage == index ? 10 : 6,
          height: currentPage == index ? 10 : 6,
          decoration: BoxDecoration(
            color: currentPage == index ? Colors.green : Colors.grey,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
