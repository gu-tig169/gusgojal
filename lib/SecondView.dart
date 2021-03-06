import 'package:firstapp/Model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondView extends StatelessWidget {

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: Text('Lägg till uppgifter',
          style: GoogleFonts.sansita(),
          ),
        )
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top:30.0,),
                child: TextField(
                  controller: myController,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Lägg till uppgift...',
                    border: OutlineInputBorder(),
    ),
  ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 95.0, top: 20),
                child: Row(
                  children: [
                    _addButton(context, myController),
                    _textAdd(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



Widget _addButton(context, TextEditingController myController) {
  return IconButton(
      iconSize: 40.0,
      icon: Icon(Icons.add),
      color: Colors.amber,
      onPressed: () {
        if (myController.text == '') {
          Navigator.pop(context);
        } else { 
          Navigator.pop(
            context, Item(checkBoxIs: false, thingsToDo: myController.text));
      
        }
      }
      );
}

Widget _textAdd() {
  return Text(
    'Lägg till',
    style: GoogleFonts.sansita(
      color: Colors.white,
      fontSize: 20.0,
      
    ),
  );
}