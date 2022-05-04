import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String quote = "";
  String author_name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 32, 2, 112),
        title: Center(child: Text("Quotes App")),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              color: Color.fromARGB(255, 32, 2, 112),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  quote,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 200),
            child: Card(
              color: Color.fromARGB(255, 110, 11, 4),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  author_name,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Text(
              "Press the + Button to get new quote....",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Color.fromARGB(255, 32, 2, 112),
          onPressed: (() async {
            var url = Uri.parse(
                'https://goquotes-api.herokuapp.com/api/v1/random?count=1');
            var response = await http.get(url);
            print("Response Message: ${response.body}");
            print("Response status code: ${response.statusCode}");
            var data = jsonDecode(response.body);
            quote = data["quotes"][0]['text'];
            author_name = data["quotes"][0]['author'];
            setState(() {});
          })),
    );
  }
}
