import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

class calculadora2 extends StatefulWidget {
  const calculadora2({super.key});

  @override
  State<calculadora2> createState() => _calculadora2State();
}

class _calculadora2State extends State<calculadora2> {
  TextEditingController _pesoController = new TextEditingController();
  TextEditingController _alturaController = new TextEditingController();
  String infoText = "Status";

  void resetfield() {
    setState(() {
      _pesoController.text = "";
      _alturaController.text = "";
      infoText = "Status!";
    });

  }

  void _status() {
    double imc = (double.parse(_pesoController.text)/(pow((double.parse(_alturaController.text))/100, 2)));
    print(_pesoController.text);
    print(_alturaController.text);
    print(double.parse(_alturaController.text));
    print(double.parse(_alturaController.text)*double.parse(_alturaController.text));
    print(pow(double.parse(_alturaController.text), 2));
    print(imc);
    if(imc<18.5){
      setState(() {
        infoText="Abaixo do peso";
      });
    }else if(18.5<=imc && imc<=24.99){
      setState(() {
        infoText="Peso normal";
      });
    }else if(25<=imc &&imc<=29.99){
      setState(() {
        infoText="Acima do peso";
      });
    }else if(30<=imc && imc<=34.99){
      setState(() {
        infoText="Obesidade I";
      });
    }else if(35<=imc && imc<=39.99){
      setState(() {
        infoText="Obesidade II (severa)";

      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              right: 30.0,
            ),
          ),
          IconButton(
            onPressed: resetfield,
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(30.0),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_3_rounded,
                size: 120,
                color: Colors.black,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _pesoController,
                decoration: InputDecoration(
                  labelText: "Peso em kg",
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 25.0,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(30)),
              TextField(
                controller: _alturaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Altura em cm",
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 25.0,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _status,
                child: Text("Cálcular"),
              ),
              Padding(padding: EdgeInsets.all(30)),
              Text(
                infoText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 25.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
