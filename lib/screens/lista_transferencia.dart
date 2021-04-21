import 'package:alura/models/transferencia.dart';
import 'package:alura/screens/formulario_transferencia.dart';
import 'package:flutter/material.dart';

class Lista extends StatefulWidget {
  // ignore: deprecated_member_use
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferencia();
  }
}

class ListaTransferencia extends State<Lista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then(
            (transferenciaRecebida) =>
                widget._transferencias.add(transferenciaRecebida),
          );
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferecnia;

  ItemTransferencia(this._transferecnia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferecnia.valor.toString()),
        subtitle: Text(_transferecnia.conta.toString()),
      ),
    );
  }
}
