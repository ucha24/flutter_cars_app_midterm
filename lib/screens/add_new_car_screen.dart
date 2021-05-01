import 'package:flutter/material.dart';
import 'package:flutter_cars_app_ex/data/models/car_model.dart';
import 'package:flutter_cars_app_ex/data/repository/car_helper.dart';

class AddNewCarScreen extends StatelessWidget {
  static const routeName = "/add-new-car";

  final _formKey = GlobalKey<FormState>();

  TextEditingController carID = TextEditingController();
  TextEditingController carName = TextEditingController();
  TextEditingController carDescription = TextEditingController();
  TextEditingController carYear = TextEditingController();
  TextEditingController carModel = TextEditingController();
  TextEditingController carUrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Cars"),
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
                    decoration: InputDecoration(hintText: "Please enter ID"),
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
                        return "Please enter brand";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: carModel,
                    decoration:
                    InputDecoration(hintText: "Please enter model"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid model";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: carYear,
                    decoration:
                        InputDecoration(hintText: "Please enter year"),
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
                    keyboardType: TextInputType.number,
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
                            imageUrl: carUrl.text,
                            id: int.parse(carID.text),
                            brand: carName.text,
                            model: carModel.text,
                            year: int.parse(carYear.text),
                            description: carDescription.text,
                          );
                          CarRepository().addCar(car);
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
