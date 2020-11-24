import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ViewList.dart';
import 'Model.dart';
import 'SecondView.dart';


class MainView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Padding(
          padding: const EdgeInsets.only(left: 130),
          child: Text(
            'Uppgifter',
          ),
        ),
        actions: [
          _dropdownMenu(),
        ],
      ),
      body: ViewList(),
  
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.white,
   
          onPressed: () async {
            print('Knapp funkar');
            var newToDo = await Navigator.push(
                context, MaterialPageRoute(builder: (context) => SecondView()));

                if(newToDo!= '') {
                  Provider.of<Model>(context, listen: false).addToList(newToDo);
                }
          },
        ),
      ),
    );
  }
}

//Dropdown-meny som syftar till att filtrera listan.
Widget _dropdownMenu() {
  List<String> choices = ['All', 'Done', 'Not done'];

  return Padding(
    padding: const EdgeInsets.only(right: 20.0),
    child: PopupMenuButton<String>(
      icon: Icon(
        Icons.tune_rounded,
      ),
      itemBuilder: (BuildContext context) {
        return choices.map((String choice) {
          return PopupMenuItem(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    ),
  );
}

