import 'package:alura/components/editor.dart';
import 'package:alura/models/transferencia.dart';
import 'package:flutter/material.dart';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Formulario();
  }
}

class Formulario extends State<FormularioTransferencia> {
  final TextEditingController _controladorConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar uma transferência'),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            color: Colors.blue,
            onPressed: () => _transferir(context),
          ),
        ],
      ),
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
