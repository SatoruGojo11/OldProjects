import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffectApp extends StatefulWidget {
  const ShimmerEffectApp({super.key});

  @override
  State<ShimmerEffectApp> createState() => _ShimmerEffectAppState();
}

class _ShimmerEffectAppState extends State<ShimmerEffectApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shimmer Effect App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                child: Row(
                  children: [
                    field(Colors.grey, 120.0, 120.0),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        field(Colors.grey, 10.0, 50.0),
                        SizedBox(height: 10),
                        field(Colors.grey, 80.0, 220.0),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(thickness: 3),
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}

field(color, h1, w1,) {
  return Container(
    color: color,
    height: h1,
    width: w1,
  );
}
