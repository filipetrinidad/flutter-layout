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
        ItemTransferencia(),
        ItemTransferencia(),
        ItemTransferencia(),
      ],
    );
  }
}

class ItemTransferencia extends StatelessWidget {

  final String valor;
  final String conta;

  ItemTransferencia(this.valor, this.conta);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(valor),
        subtitle: Text(conta),
      ),
    );
  }
}


