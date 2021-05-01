import 'package:flutter/material.dart';
import 'package:flutter_cars_app_ex/data/models/car_model.dart';
import 'package:flutter_cars_app_ex/data/models/dummy_data.dart';
import 'package:flutter_cars_app_ex/data/repository/car_helper.dart';

class CarDetailsScreen extends StatelessWidget {
  static const routeName = "/details-screen";



  @override
  Widget build(BuildContext context) {
    final int index = ModalRoute.of(context)!.settings.arguments as int;
    final Car car = DUMMY_DATA[index];

    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text("Delete Confirmation"),
                content: Text(
                  "Do you really want to delete this car?",
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("NO"),
                  ),
                  TextButton(
                    onPressed: () {
                      CarRepository().removeCar(index);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Text("YES"),

                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              FadeInImage(
                placeholder: AssetImage(
                  "assets/images/car_placeholder.png",
                ),
                image: NetworkImage(
                  car.imageUrl,
                ),
                height: 250,
              ),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Brand:",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            "Model: ",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            "Year: ",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(car.brand),
                          Text(car.model),
                          Text(car.year.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 350,
                child: Text(
                  car.description,
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
