import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 55.0),
          child: Text('Alex To-Do'),
        )),
        actions: [
          _dropdownMenu(),
             ],
        
      ),
      body: ListView(children: [
        _checkbox('Plugga'),
        _checkbox('Skriva'),
        _checkbox('Städa'),
        _checkbox('Kolla TV'),
        _checkbox('Sova'),
        _checkbox('Handla mat'),
        _checkbox('Meditera'),
        _checkbox('Tvätta'),
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.black,
        onPressed: () {
          print('Knappen funkar');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondView()));
        },
      ),
    );
  }
}

Widget _dropdownMenu() {
  List<String> alt = ['All', 'Done', 'Not done'];

  return PopupMenuButton<String>(
    icon: Icon(Icons.filter_list),
    onSelected: altAction,
        itemBuilder: (BuildContext context) {
          return alt.map((String alt) {
            return PopupMenuItem(
              value: alt,
              child: Text(alt),
            );
          }).toList();
        }
      );
    }
    
    class SecondView extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.black,
              title: Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Text('Lägg till uppgifter'),
              )),
          body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                _textField(),
                Padding(
                  padding: EdgeInsets.only(left: 105.0, top: 30),
                  child: Row(children: [
                    _plusIcon(),
                    _textBox(),
                  ]),
                ),
              ],
            ),
          ),
        );
      }
    }
    
    Widget _textBox() {
      return Text('Lägg till');
    }
    
    Widget _plusIcon() {
      return IconButton(
        icon: Icon(Icons.add),
        onPressed: () {},
      );
    }
    
    Widget _textField() {
      return TextField(
          decoration: InputDecoration(
              hintText: 'Lägg till uppgift', border: const OutlineInputBorder()));
    }
    
    Widget _checkbox(String toDo) {
      return CheckboxListTile(
          title: Text(toDo),
          value: false,
          onChanged: (value) {
            print('Hej');
          });
    }
    
    void altAction(String alt) {
      if (alt == 'All') {
        print('You pressed: All');
        } 
        else if(alt == 'Done') {
          print('You pressed Done');
        } 
        else if(alt == 'Not done') {
          print('You pressed not done');
        }
}
