import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../helper/Database.dart';
import '../Controller/WidgetElements.dart';
import '../Controller/ThemeElements.dart';
import 'Category_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<String> categoryitems = [
    'SmartPhones',
    'Fashion',
    'Grocery',
    'Appliances',
    'Furniture',
    'Headphones',
    'Books',
  ];

  final List<String> categoryitemsimg = [
    'https://sm.mashable.com/t/mashable_in/article/t/the-best-s/the-best-smartphones-of-2021-so-far_hrhs.1248.jpg',
    'https://img.freepik.com/premium-photo/beautiful-young-woman-model-hipster-man-fashionable-denim-clothes-with-sunglasses-are-walking-city-urban-fashionable-couple-outdoors_338491-17830.jpg',
    'https://media.istockphoto.com/id/1157106624/photo/all-your-necessities-stored-in-one-place.jpg?b=1&s=612x612&w=0&k=20&c=NGOYdzmQe-koR-Ep9PqIBsoWZBH3iy2ffW3iEVyHiJI=',
    'https://previews.123rf.com/images/maxxyustas/maxxyustas1411/maxxyustas141100032/33641100-home-appliances-set-of-household-kitchen-technics-isolated-on-white-fridge-gas-cooker-microwave.jpg',
    'https://images.woodenstreet.de/image/cache/data%2Fsofa-beds-mdf%2Fectar-sofa-cum-bed-with-box-storage%2Fexotic-teak%2Fupdated-new%2F1-810x702.jpg',
    'https://media.wired.com/photos/63e69de969cf98bf35404277/16:9/w_2399,h_1349,c_limit/Best-Wireless-Headphones-Featured-Focal-Bathys-Gear.jpg',
    'https://images.squarespace-cdn.com/content/v1/5740a666356fb0ac05b2b01c/1574783818285-9WT3HN0694EGWC7LSY3Q/books.jpg?format=1500w',
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaquery = MediaQuery.of(context);
    var h1 = mediaquery.size.height;
    var w1 = mediaquery.size.width;

    return Consumer3(
      builder: (BuildContext context,
          Themeelements themeshortcut,
          Widgetselements widgetshortcut,
          DatabaseLogics databaselogic,
          Widget? child) {
        return SafeArea(
          child: Scaffold(
            drawer: widgetshortcut.drawerofmyapp(
                h1 / 3, w1 / 1.6, Colors.green, context),
            appBar: AppBar(
              backgroundColor: themeshortcut.bgcolor,
              title: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: widgetshortcut.text(
                  'Trendy Bazzar',
                  size: h1 / 25,
                  fw: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: widgetshortcut.icon(
                    Icons.notifications,
                    size: h1 / 20,
                    clr: Colors.black,
                  ),
                ),
              ],
            ),
            backgroundColor: themeshortcut.bgcolor,
            bottomNavigationBar: widgetshortcut.curvednavbar(context),
            body: SingleChildScrollView(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Container(
                    height: h1 / 4.5,
                    color: Colors.orange,
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              widgetshortcut.text(
                                'Categories',
                                color: Colors.white,
                                fw: FontWeight.bold,
                                size: h1 / 30,
                              ),
                              TextButton(
                                onPressed: () {
                                  widgetshortcut.navigation(
                                      CategoryScreen(), context);
                                },
                                child: widgetshortcut.text('See All'),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                themeshortcut.addwidth(w1 / 20),
                            itemCount: 7,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        categoryitemsimg[index],
                                      ),
                                      radius: h1 / 20,
                                    ),
                                    themeshortcut.addheight(h1 / 60),
                                    widgetshortcut.text(
                                      categoryitems[index],
                                      size: h1 / 45,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  themeshortcut.addheight(h1 / 60),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: h1 / 50),
                      child: widgetshortcut.text(
                        "Today's Deals",
                        fw: FontWeight.bold,
                        size: w1 / 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  themeshortcut.addheight(h1 / 80),
                  Container(
                    height: h1 / 2,
                    width: w1 / 1.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(top: h1 / 80),
                      crossAxisCount: 2,
                      mainAxisSpacing: h1 / 40,
                      crossAxisSpacing: h1 / 35,
                      shrinkWrap: true,
                      children: [
                        InkWell(
                          child: widgetshortcut.todaydealsst(0, h1, w1),
                        ),
                        InkWell(
                          child: widgetshortcut.todaydealsst(1, h1, w1),
                        ),
                        InkWell(
                          child: widgetshortcut.todaydealsst(2, h1, w1),
                        ),
                        InkWell(
                          child: widgetshortcut.todaydealsst(3, h1, w1),
                        ),
                      ],
                    ),
                  ),
                  themeshortcut.addheight(h1 / 60),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: h1 / 50),
                      child: widgetshortcut.text(
                        'Suggested For you by your shopping history',
                        fw: FontWeight.bold,
                        size: w1 / 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  themeshortcut.addheight(h1 / 80),
                  Container(
                    height: h1 / 1.8,
                    width: w1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(top: h1 / 80),
                      crossAxisCount: 2,
                      mainAxisSpacing: h1 / 40,
                      shrinkWrap: true,
                      children: [
                        InkWell(
                          child: widgetshortcut.suggestedst(0, h1, w1),
                        ),
                        InkWell(
                          child: widgetshortcut.suggestedst(1, h1, w1),
                        ),
                        InkWell(
                          child: widgetshortcut.suggestedst(2, h1, w1),
                        ),
                        InkWell(
                          child: widgetshortcut.suggestedst(3, h1, w1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
/*

 CarouselSlider(
                    items: [
                      Container(
                        decoration: BoxDecoration(
                          color: themeshortcut.bgcolor,
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                              image: AssetImage('assets/images/1.jpg')),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: themeshortcut.bgcolor,
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                              image: AssetImage('assets/images/2.jpg')),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: themeshortcut.bgcolor,
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                              image: AssetImage('assets/images/3.jpg')),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: themeshortcut.bgcolor,
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                              image: AssetImage('assets/images/4.jpg')),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: themeshortcut.bgcolor,
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                              image: AssetImage('assets/images/5.jpg')),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                              image: AssetImage('assets/images/6.jpg')),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: themeshortcut.bgcolor,
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                              image: AssetImage('assets/images/7.jpg')),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      animateToClosest: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      height: h1 / 4,
                      aspectRatio: 16 / 9,
                      enlargeCenterPage: true,
                    ),
                  ),
 */
