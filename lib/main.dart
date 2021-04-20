import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Lista(),
      ),
    );
  }
}

class Formulario extends StatelessWidget {
  final TextEditingController _controladorConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crir uma transferência'),
      ),
      body: Column(
        children: [
          Editor(
              controlador: _controladorConta,
              rotulo: 'Número da conta',
              dica: '00000'),
          Editor(
              controlador: _controladorValor,
              rotulo: 'Valor',
              dica: '0.0',
              icon: Icons.monetization_on),
          RaisedButton(
            child: Text('Confirmar'),
            color: Colors.green,
            onPressed: () => _transferir(context),
          ),
        ],
      ),
    );
  }

  void _transferir(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorConta.text);
    final double numeroValor = double.tryParse(_controladorValor.text);
    if (numeroConta != null && numeroValor != null) {
      final transferenciaCriada = Transferencia(numeroValor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icon;

  Editor({this.controlador, this.rotulo, this.dica, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
            icon: icon != null ? Icon(icon) : null,
            labelText: rotulo,
            hintText: dica),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class Lista extends StatefulWidget {
  // ignore: deprecated_member_use
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
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
        itemCount:  widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () {
          final Future<Transferencia> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Formulario();
          }));
          future.then((transferenciaRecebida) {
            widget._transferencias.add(transferenciaRecebida);
          });
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

class Transferencia {
  final double valor;
  final int conta;

  Transferencia(this.valor, this.conta);

  @override
  String toString() {
    return '$valor , $conta';
  }
}
