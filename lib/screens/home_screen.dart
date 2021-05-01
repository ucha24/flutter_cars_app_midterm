import 'package:flutter/material.dart';
import 'package:flutter_cars_app_ex/data/models/dummy_data.dart';
import 'package:flutter_cars_app_ex/data/models/car_model.dart';
import 'package:flutter_cars_app_ex/data/repository/car_helper.dart';
import 'package:flutter_cars_app_ex/screens/edit_car_screen.dart';
import 'package:flutter_cars_app_ex/screens/car_details_screen.dart';
import 'package:flutter_cars_app_ex/widgets/main_list_item.dart';

import 'add_new_car_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

List<Car> carList = DUMMY_DATA;

void reset() {
  carList = DUMMY_DATA;
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cars"),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () =>
            Navigator.pushNamed(context, AddNewCarScreen.routeName).then((_) {
              setState(() {});
            }),
            child:Icon(
              Icons.add,
              color: Colors.white,
              size: 30.0,
            ),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          var car = carList[index];
          return GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                CarDetailsScreen.routeName,
                arguments: index,
              ).then((value) => setState(() {})),
              onLongPress: () {
                Navigator.pushNamed(
                  context,
                  EditCarScreen.routeName,
                  arguments: {"car": car, "index": index},
                ).then((_) {
                  setState(() {});
                });
              },
              child: MainListItem(
                imageUrl: car.imageUrl,
                title: car.brand,
                year: car.year.toString(),
                model: car.model.toString(),
              ),
            );
        },
        itemCount: carList.length,
      ),
    );
  }
}
