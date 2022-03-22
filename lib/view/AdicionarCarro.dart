import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../main.dart';
import '../provider/CarroProvider.dart';

class AdicionarCarro extends StatefulWidget {
  const AdicionarCarro({Key? key}) : super(key: key);

  @override
  State<AdicionarCarro> createState() => _AdicionarCarroState();
}

class _AdicionarCarroState extends State<AdicionarCarro> {
  //campos que controlam os textos
  TextEditingController marcaController = TextEditingController();
  TextEditingController modeloController = TextEditingController();
  TextEditingController anoController = TextEditingController();
  TextEditingController placaController = TextEditingController();
  TextEditingController corController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var ano =
        MaskTextInputFormatter(mask: '####', filter: {"#": RegExp(r'[0-9]')});
    var placa = MaskTextInputFormatter(
        mask: 'AAA-####', filter: {"#": RegExp(r'[0-9]')});

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const Text("Marca", style: TextStyle(fontSize: 20)),
            TextField(
              controller: marcaController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Marca do carro",
              ),
            ),
            const Text("Modelo", style: TextStyle(fontSize: 20)),
            TextField(
              controller: modeloController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Modelo do carro",
              ),
            ),
            const Text("Ano", style: TextStyle(fontSize: 20)),
            TextField(
              controller: anoController,
              keyboardType: TextInputType.number,
              inputFormatters: [ano],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Ano do carro",
              ),
            ),
            const Text("Placa", style: TextStyle(fontSize: 20)),
            TextField(
              controller: placaController,
              keyboardType: TextInputType.number,
              inputFormatters: [placa],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Placa do carro",
              ),
            ),
            const Text("Cor", style: TextStyle(fontSize: 20)),
            TextField(
              controller: corController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Cor do carro",
              ),
            ),
            ButtonTheme(
              child: ElevatedButton(
                onPressed: _inserir,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Adicionar", style: TextStyle(fontSize: 20)),
                ),
              ),
              buttonColor: Colors.blue,
            )
          ],
        ),
      ),
    );
  }

  void _inserir() async {
    CarroProvider carro = CarroProvider();
    Map<String, dynamic> linha = {
      'marca': marcaController.text,
      'modelo': modeloController.text,
      'ano': anoController.text,
      'placa': placaController.text,
      'cor': corController.text,
    };
    await carro.insert(linha);
    Navigator.pop(context);
  }
}
