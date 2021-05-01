import 'package:flutter/material.dart';
import 'package:flutter_cars_app_ex/data/models/car_model.dart';
import 'package:flutter_cars_app_ex/data/repository/car_helper.dart';

class EditCarScreen extends StatefulWidget {
  static const routeName = "/edit-car-screen";

  @override
  _EditCarScreenState createState() => _EditCarScreenState();
}

class _EditCarScreenState extends State<EditCarScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController carUrl;
  late TextEditingController carID;
  late TextEditingController carName;
  late TextEditingController carModel;
  late TextEditingController carYear;
  late TextEditingController carDescription;

  @override
  Widget build(BuildContext context) {
    final Map parsedData = ModalRoute.of(context)!.settings.arguments as Map;
    final Car car = parsedData["car"];
    final int index = parsedData["index"];

    carUrl = TextEditingController(text: car.imageUrl);
    carID = TextEditingController(text: car.id.toString());
    carName = TextEditingController(text: car.brand);
    carModel = TextEditingController(text: car.model);
    carYear = TextEditingController(text: car.year.toString());
    carDescription = TextEditingController(text: car.description);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Car"),
        actions: <Widget>[
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Card(
                  child: TextFormField(
                    controller: carUrl,
                    decoration: InputDecoration(hintText: "Please enter Image Url"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid url";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: carID,
                    decoration: InputDecoration(hintText: "Please enter Id"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid id";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: carName,
                    decoration: InputDecoration(hintText: "Please enter brand"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid brand";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: carModel,
                    decoration:
                    InputDecoration(hintText: "Please enter category"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid category";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: carYear,
                    decoration:
                        InputDecoration(hintText: "Please enter year date"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid year";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: carDescription,
                    decoration:
                    InputDecoration(hintText: "Please enter description"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid description";
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Back"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Car car = Car(
                            id: int.parse(carID.text),
                            brand: carName.text,
                            imageUrl: carUrl.text,
                            description: carDescription.text,
                            year: int.parse(carYear.text),
                            model: carModel.text,
                          );
                          CarRepository().editCar(car, index);
                          Navigator.pop(context);
                        }
                      },
                      child: Text("Add"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
