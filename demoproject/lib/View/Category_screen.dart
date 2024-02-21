import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Controller/ThemeElements.dart';
import '../Controller/WidgetElements.dart';
import '../helper/Database.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

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
    // var w1 = mediaquery.size.width;

    return Consumer3(
      builder: (BuildContext context,
              Themeelements themeshortcut,
              Widgetselements widgetshortcut,
              DatabaseLogics databaselogic,
              Widget? child) =>
          SafeArea(
            child: Scaffold(
                  backgroundColor: themeshortcut.bgcolor,
                  body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: widgetshortcut.text('Category Screen',
                        size: h1 / 25, fw: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.all(7),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(top: h1 / 100),
                      crossAxisCount: 2,
                      mainAxisSpacing: h1 / 40,
                      shrinkWrap: true,
                      children: [
                        widgetshortcut.cardofcategory(
                            categoryitemsimg[0], categoryitems[0], h1),
                        widgetshortcut.cardofcategory(
                            categoryitemsimg[1], categoryitems[1], h1),
                        widgetshortcut.cardofcategory(
                            categoryitemsimg[2], categoryitems[2], h1),
                        widgetshortcut.cardofcategory(
                            categoryitemsimg[3], categoryitems[3], h1),
                        widgetshortcut.cardofcategory(
                            categoryitemsimg[4], categoryitems[4], h1),
                        widgetshortcut.cardofcategory(
                            categoryitemsimg[5], categoryitems[5], h1),
                        widgetshortcut.cardofcategory(
                            categoryitemsimg[6], categoryitems[6], h1),
                      ],
                    ),
                  ),
                ],
              ),
            ),
                  ),
                ),
          ),
    );
  }
}
