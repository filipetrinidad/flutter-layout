import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Lista(),
        appBar: AppBar(
          title: Text('Transferências'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
      ),
    ));

class Lista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('600'),
            subtitle: Text('1000'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('200'),
            subtitle: Text('1000'),
          ),
        ),
      ],
    );
  }
}

