import 'package:flutter/material.dart';

class MainListItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String year;
  final String model;

  MainListItem({
    required this.imageUrl,
    required this.title,
    required this.year,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: FadeInImage(
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                placeholder: AssetImage("assets/images/car_placeholder.png"),
                image: NetworkImage(imageUrl),
              ),
            ),
            Text(title),
            Text(year),
          ],
        ),
      ),
    );
  }
}
