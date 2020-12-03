import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Model.dart';

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = 'e8018d16-ac44-4386-939e-589e2c869172';

class Api {
  static Future addList(Item item) async {
    var json = jsonEncode(Item.toJson(item));
    await http.post('$API_URL/todos?key=$API_KEY', 
      body: json,
      headers: {'Content-Type': 'application/json'},
    );
  }


  static Future<List<Item>> getItem() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    var json = jsonDecode(response.body);
    print(json);

    return json.map<Item>((data) {
      return Item.fromJson(data);
    }).toList();
  }

  static Future deleteItem(String itemId) async {
    print(itemId);
    await http.delete('$API_URL/todos/$itemId?key=$API_KEY');
  }

  static Future updateItem(Item item) async {
    var itemId = item.id;
    print(itemId);
    
    var json = jsonEncode(Item.toJson(item));
    await http.put('$API_URL/todos/$itemId?key=$API_KEY',
    body: json,
    headers: {'Content-Type': 'application/json'},
    );

  }
}