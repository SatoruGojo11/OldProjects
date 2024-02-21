import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var searchkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 150.0,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Image.asset('assets/images/flipkart_hp.webp'),
                SizedBox(width: 10),
                Text(
                  'Flipkart',
                  style: GoogleFonts.heebo(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                    fontSize: 30,
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            TextFormField(
              key: searchkey,
              decoration: InputDecoration(
                  counterStyle: TextStyle(color: Colors.white54),
                  filled: true,
                  hintText: 'Search for products',
                  hintStyle: TextStyle(color: Colors.black),
                  labelText: 'Search',
                  labelStyle: TextStyle(color: Colors.black),
                  hoverColor: Colors.black,
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.mic),
                      SizedBox(width: 15),
                      Icon(Icons.camera_alt_outlined),
                      SizedBox(width: 15),
                    ],
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            items: [
              Image.asset('assets/images/1.jpg'),
              Image.asset('assets/images/2.jpg'),
              Image.asset('assets/images/3.jpg'),
              Image.asset('assets/images/4.jpg'),
              Image.asset('assets/images/5.jpg'),
              Image.asset('assets/images/6.jpg'),
              Image.asset('assets/images/7.jpg'),
            ],
            options: CarouselOptions(
              autoPlay: true,
              // aspectRatio: double.infinity,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              height: 200.0,
              enlargeCenterPage: true,
            ),
          ),
          Container(
            color: Colors.white54,
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 70,
                      child: IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/images/super_coin.jpg'),
                      ),
                    ),
                    Text('Supecoins'),
                  ],
                ),
                SizedBox(width: 8),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 70,
                      child: IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/images/credit.jpg'),
                      ),
                    ),
                    Text('Credit'),
                  ],
                ),
                SizedBox(width: 8),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 70,
                      child: IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/images/prize.jpg'),
                      ),
                    ),
                    Text('Win a prize'),
                  ],
                ),
                SizedBox(width: 8),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 70,
                      child: IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/images/group.png'),
                      ),
                    ),
                    Text('Group'),
                  ],
                ),
                SizedBox(width: 8),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 70,
                      child: IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/images/camera.jpg'),
                      ),
                    ),
                    Text('Camera'),
                  ],
                ),
                SizedBox(width: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
