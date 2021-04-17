import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Formulario(),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controladorConta,
              style: TextStyle(
                fontSize: 24.0
              ),
              decoration: InputDecoration(
                labelText: 'Número da conta',
                hintText: '0000'
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controladorValor,
              style: TextStyle(
                fontSize: 24.0
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0,00',
              ),
            ),
          ),
          RaisedButton(
            child: Text('Confirmar'),
            color: Colors.green,
            onPressed: () {
              final int numeroConta = int.tryParse(_controladorConta.text);
              final double numeroValor = double.tryParse(_controladorValor.text);

              if(numeroConta != null && numeroValor!= null){
                final transferenciaCriada = Transferencia(numeroValor, numeroConta);
                debugPrint('$transferenciaCriada');
              }
            },
          ),
        ],
      ),
    );
  }
}


class Lista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(100.0, 200)),
          ItemTransferencia(Transferencia(300.0, 400)),
          ItemTransferencia(Transferencia(300.0, 1000)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
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
  String toString(){
    return '$valor , $conta';
  }

}
