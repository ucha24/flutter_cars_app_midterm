import 'package:flutter_cars_app_ex/data/models/dummy_data.dart';
import 'package:flutter_cars_app_ex/data/models/car_model.dart';

class CarRepository {
  void addCar(Car car) {
    DUMMY_DATA.add(car);
  }


  void removeCar(int index) {
    DUMMY_DATA.removeAt(index);
  }

  void editCar(Car car, int index) {
    DUMMY_DATA.replaceRange(index, index + 1, [car]);
  }
}