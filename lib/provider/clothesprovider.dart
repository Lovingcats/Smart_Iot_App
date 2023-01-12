import 'package:flutter/material.dart';
import 'package:smart_iot/model/clothes.dart';

class ClothesProvider extends ChangeNotifier {
  late List<Clothes> _clothList = <Clothes>[];
  int _index = 0;

  int get index => _index;
  List<Clothes> get clothList => _clothList;

  void inputClothData(String url, String name) {
    clothList.add(Clothes(url, name));
    notifyListeners();
  }

  //void inputIndex(int index1) {
   // index = index1;
   //  }
}
