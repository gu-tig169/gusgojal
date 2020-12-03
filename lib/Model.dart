import 'package:flutter/material.dart';
import 'Api.dart';

class Item {
  String thingsToDo;
  bool checkBoxIs;
  String id;

  Item({this.thingsToDo, this.checkBoxIs: false, this.id});

  static Map<String, dynamic> toJson(Item item) {
    return {
      'title': item.thingsToDo,
      'done': item.checkBoxIs,
    };
  }

  static Item fromJson(Map<String, dynamic> json) {
    return Item(
      thingsToDo: json['title'],
      checkBoxIs: json['done'],
      id: json['id']
      );

  }
}

class Model extends ChangeNotifier {
  List<Item> _list = [];
  String _filterBy = 'All';

  List<Item> get list => _list;

  Future getList() async {
    List<Item> list = await Api.getItem();
    _list = list;
    notifyListeners();
    print(list);
  }

  String get filterBy => _filterBy;

  bool getCheckbox(index) {
    return _list[index].checkBoxIs;
  }

  void addToList(Item item) async {
    await Api.addList(item);
    await getList();

  }

  void removeFromList(Item item) async{
    await Api.deleteItem(item.id);
    await getList();
  }

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }

  void setCheckbox(Item item, bool input) async {
    item.checkBoxIs = input;
    await Api.updateItem(item);
    await getList();
  }
}
