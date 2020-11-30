import 'package:flutter/material.dart';

class Item {
  String thingsToDo;
  bool checkBoxIs;

  Item({this.thingsToDo, this.checkBoxIs: false});
}

class Model extends ChangeNotifier {
  List<Item> _list = [];
  String _filterBy = 'All';

  List<Item> get list => _list;

  String get filterBy => _filterBy;

  bool getCheckbox(index) {
    return _list[index].checkBoxIs;
  }

  void addToList(Item item) {
    _list.add(item);
    notifyListeners();
  }

  void removeFromList(Item item) {
    _list.remove(item);
    notifyListeners();
  }

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }

  void setCheckbox(index, input) {
    _list[index].checkBoxIs = input;
    notifyListeners();
  }
}
