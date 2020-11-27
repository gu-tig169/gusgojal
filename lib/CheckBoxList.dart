import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Model.dart';
import 'package:circular_check_box/circular_check_box.dart';


class CheckboxList extends StatelessWidget {
  final List<Item> list;

  CheckboxList(this.list);

  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) =>
            _checkBox(list[index], context, index));
  }

  Widget _checkBox(Item item, context, index) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          leading: CircularCheckBox(
          activeColor: Colors.amber,
          value: item.checkBoxIs,
          onChanged: (bool newValue) {
            var state = Provider.of<Model>(context, listen: false);
            state.setCheckbox(index, newValue);
          }),
          title: Text(
            item.thingsToDo,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          trailing: IconButton(
            color: Colors.amber,
            icon: Icon(Icons.delete),
            onPressed: () {
              var state = Provider.of<Model>(context, listen: false);
              state.removeFromList(item);
            },
          ),
        ));
  }
}
