import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Model.dart';
import 'SecondView.dart';
import 'CheckBoxList.dart';
import 'package:google_fonts/google_fonts.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Padding(
            padding: const EdgeInsets.only(left: 140),
            child: Text(
              'Uppgifter',
              style: GoogleFonts.sansita()
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: PopupMenuButton(
                icon: Icon(Icons.tune),
                  onSelected: (value) => {
                        Provider.of<Model>(context, listen: false)
                            .setFilterBy(value)
                      },
                  itemBuilder: (context) => [
                        PopupMenuItem(child: Text('All'), value: 'all'),
                        PopupMenuItem(child: Text('Done'), value: 'Done'),
                        PopupMenuItem(child: Text('Not Done'), value: 'Not Done')
                      ]),
            )
          ],
        ),
        body: Consumer<Model>(
            builder: (context, state, child) =>
                CheckboxList(_filterList(state.list, state.filterBy))),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(18.0),
          child: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.amber,
            onPressed: () async {
              var newToDo = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondView()));

              if (newToDo != '') {
                Provider.of<Model>(context, listen: false).addToList(newToDo);
              }
            },
          ),
        ));
  }
}

List<Item> _filterList(list, filterBy) {
    print(filterBy);
    if (filterBy == "All") 
      return list;
    if (filterBy == 'Done')
      return (list.where((item) => item.checkBoxIs == true).toList());
    if (filterBy == "Not Done")
      return list.where((item) => item.checkBoxIs == false).toList();
      return list;
   
  }
