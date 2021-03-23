import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _resposta = "Aguardando calculo...";
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  _calcular() {
    double alcool = double.parse(_controllerAlcool.text);
    double gasolina = double.parse(_controllerGasolina.text);

    if (alcool / gasolina >= 0.7) {
      setState(() {
        _resposta = 'Abastença com Gasolina';
      });
    } else {
      setState(() {
        _resposta = 'Abastença com Alcool';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compare Oil'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Image.asset(
                  'lib/resources/images/tesoura.png',
                  alignment: Alignment.center,
                ),
              ),
              Padding(
                child: Text('Saiba o melhor valor para abastecer seu veículo'),
                padding: const EdgeInsets.only(bottom: 30),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Digite o preço",
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Preço, exemplo: Gasolina 5.90',
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                ),
                onSubmitted: (String value) {
                  print('O valor digitado foi $value');
                },
                controller: _controllerGasolina,
              ),
              Padding(padding: const EdgeInsets.fromLTRB(20, 10, 20, 20)),
              TextField(
                keyboardType: TextInputType.number,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Preço, exemplo: Alcool 3.50',
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                ),
                onSubmitted: (String value) {
                  print('O valor digitado foi $value');
                },
                controller: _controllerAlcool,
              ),
              Padding(padding: const EdgeInsets.only(top: 55)),
              RaisedButton(
                  color: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Text(
                    "Converter",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: _calcular),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  _resposta,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: BottomAppBar(
          child: IconButton(
            icon: Icon(Icons.sync),
          ),
        ),
      ),
    );
  }
}
