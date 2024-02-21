import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../helper/Database.dart';
import '../Controller/WidgetElements.dart';
import '../Controller/ThemeElements.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final notifications = [
    "You have items in your cart! Don't forget to checkout.",
    "We have new products in stock that you might like!",
    "Save up to 50% on our latest sale!",
    "Your order has been placed! Your items will be shipped soon.",
    "Your order has shipped! Your tracking number is XXX-XXXX-XXXX.",
    "We have received your inquiry and will be in touch shortly.",
    "Happy birthday! Here's a special discount for you.",
    "Please verify your email address to continue using our app.",
    "We have released a new app update with bug fixes and performance improvements. Please update your app to the latest version.",
    "We would love to hear your feedback about our app. Please take a few minutes to complete our survey.",
    "This product is now in stock! Order yours now before they sell out!",
    "We're running a flash sale! Get 20% off all items in our clearance section.",
    "Don't miss out on our Black Friday deals! Save up to 75% on select items.",
    "Cyber Monday is here! Shop our biggest sale of the year and save up to 90%.",
    "Subscribe to our newsletter and get 10% off your next order.",
    "Follow us on social media for exclusive deals and discounts.",
    "Check out our blog for the latest fashion trends and news.",
    "Contact us if you have any questions or need help with your order.",
    "Thank you for shopping with us!",
  ];

  final time = [
    "10:00 AM",
    "11:00 AM",
    "12:00 PM",
    "1:00 PM",
    "2:00 PM",
    "3:00 PM",
    "4:00 PM",
    "5:00 PM",
    "6:00 PM",
    "7:00 PM",
    "8:00 PM",
    "9:00 PM",
    "10:00 PM",
    "11:00 PM",
    "12:00 AM",
    "1:00 AM",
    "2:00 AM",
    "3:00 AM",
    "4:00 AM",
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer3(
      builder: (BuildContext context,
          Themeelements themeshortcut,
          Widgetselements widgetshortcut,
          DatabaseLogics databaselogic,
          Widget? child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: themeshortcut.appbarcolor,
            title: Text('Notifications'),
          ),
          body: ListView.separated(
            itemCount: notifications.length,
            separatorBuilder: (context, index) => Divider(thickness: 3),
            itemBuilder: (context, index) {
              if (notifications.length != 0) {
                return ListTile(
                  leading: Icon(
                    Icons.notifications,
                    color: themeshortcut.bgcolor,
                    semanticLabel: 'Notification',
                  ),
                  title: widgetshortcut.text(notifications[index]),
                  subtitle: widgetshortcut.text(time[index]),
                );
              } else {
                return Shimmer.fromColors(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          child: Row(
                            children: [
                              Center(
                                child: Text(
                                  '$index',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  widgetshortcut.container(
                                      Colors.grey, 10.0, 210.0),
                                  SizedBox(height: 10),
                                  widgetshortcut.container(
                                      Colors.grey, 10.0, 310.0),
                                  SizedBox(height: 10),
                                  widgetshortcut.container(
                                      Colors.grey, 10.0, 310.0),
                                  SizedBox(height: 10),
                                  widgetshortcut.container(
                                      Colors.grey, 10.0, 310.0),
                                  SizedBox(height: 10),
                                  widgetshortcut.container(
                                      Colors.grey, 10.0, 310.0),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          Divider(thickness: 3),
                      itemCount: 10,
                    ),
                  ),
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.white,
                );
              }
            },
          ),
        );
      },
    );
  }
}
